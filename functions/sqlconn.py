import pyodbc
import datetime

def connect(dbhostname: str, dbport: int, 
            database: str = "", 
            username: str = "", password: str = "", isWindowsAuth: bool=True, 
            rawconnstr: str = ""):
    try:
        if (isWindowsAuth == True):
            conn = pyodbc.connect('Driver=ODBC Driver 17 for SQL Server;'
                      f'Server={dbhostname};'
                      f'Database={database};'
                      'Trusted_Connection=yes;')
        else:
            conn = pyodbc.connect(f'DRIVER={{ODBC Driver 18 for SQL Server}};'
                    f'SERVER={dbhostname};'
                    f'DATABASE={database};'
                    f'UID={username};'
                    f'PWD={password}')
    except:
        conn = None
    return conn

def returnrows(conn : pyodbc.Connection, 
               tablename: str, rows: list = [], filters: list = []):
    
    sql_query = f"SELECT {', '.join(rows) if rows else '*'} FROM {tablename}"
    #WHERE clause if filter is applied
    if filters:
        where_clause = ' AND '.join(filters)
        sql_query += f' WHERE {where_clause}'

    # Execute the SQL query and fetch the results
    cursor = conn.cursor()
    cursor.execute(sql_query)
    rows = cursor.fetchall()

    return rows

# Nested tuple expected, so query should look like insertrows(conn, 'Employee', (("TestName", 1),), ["FullName","ShiftID"])
def insertrows(conn : pyodbc.Connection, tablename : str, values: tuple, insertrows : list = []):
    try:
        cursor = conn.cursor()

        # if insertrows value
        if insertrows:
            columns = ', '.join(insertrows)
            placeholders = ', '.join(['?' for _ in range(len(insertrows))])
            sql_query = f"INSERT INTO {tablename} ({columns}) VALUES ({placeholders})"
            #print(sql_query)
        else:
            # if insertrows has no value
            columns = ', '.join([col[0] for col in cursor.columns(table=tablename)])
            placeholders = ', '.join(['?' for _ in range(len(values[0]))])
            sql_query = f"INSERT INTO {tablename} ({columns}) VALUES ({placeholders})"
            
        # insert query for each set of values
        rowcount = 0
        for val_set in values:
            
            cursor.execute(sql_query, tuple(val_set))
            rowcount += cursor.rowcount

        # Commit the changes
        conn.commit()

        return rowcount  #int 

    except pyodbc.Error as e:
        print(f"Error: {e}")
        return -1 #print error message and return -1

def updatesinglerows(conn: pyodbc.Connection, tablename: str, colname: str, value: str, filters: list = []):
    # Constructing the WHERE clause for update
    where_clause = " AND ".join(filters)

    # Update query with parameter placeholders
    sql_query = f"UPDATE {tablename} SET {colname} = ? "
    if where_clause:
        sql_query += f" WHERE {where_clause}"

    cursor = conn.cursor()
    cursor.execute(sql_query, (value,))
    conn.commit()

    # Return the number of rows affected
    return cursor.rowcount

def deleterows(conn: pyodbc.Connection, tablename: str, filters: list = []):
    # Constructing WHERE clause
    where_conditions = " AND ".join(filters)
    
    # Delete query
    sql_query = f"DELETE FROM {tablename}"
    if where_conditions:
        sql_query += f" WHERE {where_conditions}"

    cursor = conn.cursor()
    cursor.execute(sql_query)
    conn.commit()
    
    # Return the number of rows affected
    return cursor.rowcount


def employeeMenu(): # One flaw of this function is the lack of validation for data type inserted, need user to specify
    print("-----------------------------")
    print("Employee Menu")
    print("[1]Insert an Employee record")
    print("[2]Delete an Employee record")
    print("[3]Show all Employee records")
    print("[4]Exit")
    print("-----------------------------")

    conn = connect("(localdb)\\MSSQLLocalDB", 0, "DataCollection_1") # connection string
    table = "Employee"
    menuChoice = input("Please select an option: ")
    if menuChoice == "1":
        print("Insert Employee record")
        values = input("Please input the Full Name, ShiftID, RFID ID and FaceID of employee you would like to insert into the table (comma-separated): ")
        values = tuple(values.split(','))  # split values by comma and converting to tuple
        columns = "FullName, ShiftID, RfidID, FaceID"
        columns = columns.split(',')  # split columns by comma

        # Construct the insertrows function call
        insertrows(conn, table, (values,), columns)
        print("Sucessfully inserted.")
    
    elif menuChoice == "2": 
        print("Delete Employee record")
        filters = input("Please input Full Name and EmployeeID to remove: ") 
        filters = filters.split(',')  # Splitting filters by comma and converting to a list

        # Constructing the WHERE clause for deletion
        finalfilter = [f"{column} = '{value}'" for column, value in zip(['FullName', 'EmployeeID'], filters)]
        final_condition = " AND ".join(finalfilter)
        deleterows(conn, table, [final_condition])
        print("Sucessfully deleted.")

    elif menuChoice == "3": #returnrows(conn : pyodbc.Connection, tablename: str, rows: list = [], filters: list = []):
        print("Select all Employees")
        all_rows = returnrows(conn, table)
        print(all_rows)

    else:
        print("Thank you.")


def add_shift(conn: pyodbc.Connection, datevalue1: datetime.datetime, datevalue2: datetime.datetime):
    # Update query with parameter placeholders
    sql_query = "INSERT INTO Shift (ShiftIn, ShiftOut) VALUES (?, ?)"

    cursor = conn.cursor()
    cursor.execute(sql_query, (datevalue1, datevalue2))
    conn.commit()

    # Return the number of rows affected
    return cursor.rowcount, "record inserted"

def delete_shift(conn: pyodbc.Connection, intvalue3: int):
    sql_query = "DELETE FROM Shift WHERE ShiftID = ?"

    cursor = conn.cursor()
    cursor.execute(sql_query, (intvalue3))
    return cursor.rowcount, "Record deleted"   

def inputshift():
    print("-----------------------------")
    print("Shift Menu")
    print("[1]Insert a Shift")
    print("[2]Delete a Shift")
    print("[3]Exit")
    print("-----------------------------")
    conn = connect("(localdb)\\MSSQLLocalDB", 0, "DataCollection_1") # connection string
    choice = input("Please select an option: ")

    if choice == "1":
        value1 = input("Please input the Shift In time as a time in HH:MM (): ")
        value2 = input("Please input the Shift Out time in HH:MM (): ")
        import datetime
        
        datevalue1 = datetime.datetime.strptime(value1, '%H:%M')
        datevalue2 = datetime.datetime.strptime(value2, '%H:%M')

        # Call add_shift function with datetime objects
        add_shift(conn, datevalue1, datevalue2)

    elif choice == "2":
        filters = input("Please input Shift ID to remove: ") 
        deleterows(conn, "Shift", ["ShiftID = " + filters])
        print("Sucessfully deleted.")  
        
    else:
        print("Thank You") 


def shiftMenu():
    print("-----------------------------")
    print("Shift Menu")
    print("[1]Insert a Shift")
    print("[2]Delete a Shift")
    print("[3]Exit")
    print("-----------------------------")
    conn = connect("(localdb)\\MSSQLLocalDB", 0, "DataCollection_1") # connection string
    menuChoice = input("Please select an option: ")

    if menuChoice == "1":
        inputshift()


def mainmenu():
    print("-------------------")
    print("Main Menu")
    print("[1]Employee Menu")
    print("[2]Shift Menu")
    print("-------------------")
    choice = input("Which menu would you like to visit?: ")
    if choice == "1":
        employeeMenu()
    elif choice == "2":
        inputshift()

mainmenu()