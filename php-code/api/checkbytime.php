<?php
if ($_SERVER["REQUEST_METHOD"] !== 'POST') // if not POST
{
   http_response_code(500); // set to Internal Server Error (500)
   echo "This endpoint requires the use of POST."; // present error
   die(); // kill PHP process
}
require "../../mysqldetailsphp/connection.php"; // get connection $mysqli from root dir.
/* Check if the connection succeeded */
if (!is_null($mysqli->connect_error)) // if has a MySQL connection error
{
   echo 'Connection failed<br>'; // return error
   echo 'Error number: ' . $mysqli->connect_errno . '<br>'; // error number
   echo 'Error message: ' . $mysqli->connect_error . '<br>'; // message
   die(); //kill HTTP process
}

error_reporting(E_ERROR | E_PARSE);
$key = "EmployeeID";
if (!$_POST[$key])
{
   http_response_code(500); // set to Internal Server Error (500)
   echo "Bad Request"; // present error
   die(); // kill PHP process
}
$empid = $_POST[$key];
$query = "SELECT COUNT(*) FROM Record WHERE ((TimeIn >= NOW() - INTERVAL 10 SECOND) OR (TimeOut >= NOW() - INTERVAL 10 SECOND) AND EmployeeID = ?);"; // SQL Query
$statement = $mysqli->prepare($query);
$statement->bind_param("i", $empid);
$statement->execute();
$result = $statement->get_result();
if (!$result){ // if not result
   echo 'Query error: ' . mysqli_error($mysqli); // present query error
   die(); // kill PHP process
}
/*$employeearr = array(); // make new array for the objects
while ($row = mysqli_fetch_assoc($result)) // while fetching each row
{
   array_push($employeearr, $row); // push it into array
}
echo json_encode($employeearr); // return json array of employees*/
echo intval($result->fetch_array()[0]); // return rowcount
?>