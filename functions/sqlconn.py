'''
Use parameterised query,
eg
cursor.execute("SELECT * FROM Throughput WHERE DeviceName = ?", data['DeviceName'])
'''
import pyodbc
import datetime
'''
For developer:
Hints:
ODBC requires the use of connection strings:
(Examples below)
when IsWindowsAuth is false:
f'DRIVER={{ODBC Driver 18 for SQL Server}};
SERVER={SERVER};
DATABASE={DATABASE};
UID={USERNAME};
PWD={PASSWORD}'
when IsWindowsAuth is True:
'Driver={ODBC Driver 17 for SQL Server};'
                      'Server=localhost;'
                      'Database=master;'
                     'Trusted_Connection=yes;'
'''
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

'''
HINT:
SELECT SQL.
if rows empty, use *.
if filters empty, dont use WHERE.
'''
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

'''
HINT:
INSERT SQL.
if insertrows empty: INSERT INTO Table VALUES ...
if insertrows value: INSERT INTO Table (Col1, Col2, Col3) VALUES
values is a nested tuple, like ((1,2,3), (4,5,6)) for (Col1, Col2, Col3)
try except for those SQL errors. (not right columns etc), return a -1.
if all goes well, return amt of rows affected
'''
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
'''
HINT:
UPDATE SQL.
UPDATE {table} SET {col} = {value} WHERE {condition}
'''
def updatesinglerows(conn : pyodbc.Connection, tablename : str, colname : str, value: str, filters : list = []):

    # filters
    where_clause = " AND ".join(filters)

    # Update query
    sql_query = f"UPDATE {tablename} SET {colname} = {value} WHERE {where_clause}"

    cursor = conn.cursor()
    cursor.execute(sql_query)
    conn.commit()

    # Return the no. of rows affected
    return cursor.rowcount
'''
HINT:
DELETE SQL.
DELETE FROM {table} WHERE {condition}
'''
def deleterows(conn: pyodbc.Connection, tablename: str, filters: list = []):
    # filters, can delete multiple rows based on filters
    where_clause = " AND ".join(filters)

    # Delete query
    sql_query = f"DELETE FROM {tablename} WHERE {where_clause}"

    cursor = conn.cursor()
    cursor.execute(sql_query)
    conn.commit()
    
    
    # Return the no. of rows affected
    return cursor.rowcount