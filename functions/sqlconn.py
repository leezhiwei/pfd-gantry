'''
Use parameterised query,
eg
cursor.execute("SELECT * FROM Throughput WHERE DeviceName = ?", data['DeviceName'])
'''
import pyodbc
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
            database: str = "master", 
            username: str = "", password: str = "", isWindowsAuth: bool=True, 
            rawconnstr: str = ""):
    try:
        conn = pyodbc.Connection
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
    return tuple
'''
HINT:
INSERT SQL.
if insertrows empty: INSERT INTO Table VALUES ...
if insertrows value: INSERT INTO Table (Col1, Col2, Col3) VALUES
values is a nested tuple, like ((1,2,3), (4,5,6)) for (Col1, Col2, Col3)
try except for those SQL errors. (not right columns etc), return a -1.
if all goes well, return amt of rows affected
'''
def insertrows(conn : pyodbc.Connection, tablename : str, values: tuple, insertrows : list = []):
    return int
'''
HINT:
UPDATE SQL.
UPDATE {table} SET {col} = {value} WHERE {condition}
'''
def updatesinglerows(conn : pyodbc.Connection, tablename : str, colname : str, value: str, filters : list = []):
    return int
'''
HINT:
DELETE SQL.
DELETE FROM {table} WHERE {condition}
'''
def deleterows(conn: pyodbc.Connection, tablename: str, filters: list = []):
    return int