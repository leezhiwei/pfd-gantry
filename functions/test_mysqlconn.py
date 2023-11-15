import mysql.connector
import requests

# Create a connection
def connect(dbhostname: str, dbport: int, 
            database: str = "", 
            username: str = "", password: str = ""):
    mydb = mysql.connector.connect(
    f'host="{dbhostname}',
    f'database={database}',
    f'user={username}',
    f'password={password}'
    )
    return mydb

# SELECT SQL
def returnrows(mydb : mysql.connector, 
               tablename: str, rows: list = [], filters: list = []):
    try:
        mycursor = mydb.cursor()
        sql_query = f"SELECT {', '.join(rows) if rows else '*'} FROM {tablename}"

        # Where clause if filter is applied
        if filters:
            where_clause = ' AND '.join(filters)
            sql_query += f" WHERE {where_clause}"

        # Execute SQL Query and fetch results
        mycursor.execute(sql_query)
        rows = mycursor.fetchall()

        return rows
    
    except mydb.Error as e:
        print(f"Error: {e}")
        return -1 #print error message and return -1


# INSERT SQL
def insertrows(mydb : mysql.connector, tablename : str, values: tuple, insertrows : list = []):
    try:
        mycursor = mydb.cursor()

        # if insertrows has value
        if insertrows:
            columns = ', '.join(insertrows)
            placeholders = ', '.join(['?' for _ in range(len(insertrows))])
            sql_query = f"INSERT INTO {tablename} ({columns}) VALUES ({placeholders})"
        else: # if insertrows has no value
            columns = ', '.join([col[0] for col in mycursor.columns(table=tablename)])
            placeholders = ', '.join(['?' for _ in range(len(values[0]))])
            sql_query = f"INSERT INTO {tablename} ({columns}) VALUES ({placeholders})"

        # insert query for each set of values
        rowcount = 0
        for val_set in values:
            mycursor.execute(sql_query, val_set)
            rowcount += mycursor.rowcount

        # Commit the changes
        mydb.commit()

        return rowcount  #int 

    except mydb.Error as e:
        print(f"Error: {e}")
        return -1 #print error message and return -1


# UPDATE SQL
def updatesinglerow(mydb : mysql.connector, tablename : str, colname : str, value : str, filters : list = []):
    # filters
    where_clause = " AND ".join(filters)

    # update query 
    sql_query = f"UPDATE {tablename} SET {colname} = {value} WHERE {where_clause}"
    mycursor = mydb.cursor()
    mycursor.execute(sql_query)
    mycursor.commit()

    # return no. of rows affected
    return mycursor.rowcount

# DELETE SQL
def deleterows(mydb : mysql.connector, tablename : str, filters : list = []):
    # filters, can delete multiple rows based on filters
    where_clause = " AND ".join(filters)

    # delete query 
    sql_query = f"DELETE FROM {tablename} WHERE {where_clause}"
    mycursor = mydb.cursor()
    mycursor.execute(sql_query)
    mycursor.commit()

    #return no. of rows affected
    return mycursor.rowcount

# GET Method
def getmethod(url : str, arguments : str, cardID: str, querystring : list = []):
    if querystring:
        get = requests.get(url, arguments, cardID, querystring)
    else:
        get = requests.get(url, arguments, cardID)

    return get

# POST Method
def postmethod(url: str, args: str, cardID : str, json : dict = {}):
    post = requests.post(url, json, cardID, args)

