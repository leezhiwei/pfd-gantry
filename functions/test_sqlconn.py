import sys
from unittest import mock
import pytest
import pyodbc
from unittest.mock import patch
from sqlconn import *

def test_init():
    conn = connect("testname", 1111)
    if (conn is None):
        pytest.fail("Did not correctly return Connection, hit try")
    assert conn is pyodbc.Connection
def test_return():
    with patch("pyodbc.connect") as mock_connect:
        pyodbc.connect("Credentials")
    mock_connect.assert_called_with("Credentials")