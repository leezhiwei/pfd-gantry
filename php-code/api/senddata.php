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
$oldid = mysqli_insert_id($mysqli);
try
{
   $data = json_decode(file_get_contents('php://input'), true);
}
catch (Exception $e)
{
   http_response_code(500); // set to Internal Server Error (500)
   echo "Bad Request"; // present error
   die(); // kill PHP process
}
if (!$data["EmployeeID"] || (!$data["TimeIn"] && !$data["TimeOut"]))
{
   http_response_code(500); // set to Internal Server Error (500)
   echo "Bad Request"; // present error
   die(); // kill PHP process
}
$query = "";
$statement;
if ($data["TimeIn"] && $data["TimeOut"])
{
   http_response_code(500); // set to Internal Server Error (500)
   echo "Bad Request"; // present error
   die(); // kill PHP process
   die(); // kill PHP process
}
if ($data["TimeIn"])
{
   $query = "INSERT INTO Record (EmployeeID, TimeIn) VALUES (?,?);";
   $statement = $mysqli->prepare($query);
   $statement->bind_param("is", $data["EmployeeID"], $data["TimeIn"]);
   $statement->execute();
}
else if ($data["TimeOut"])
{
   $query = "INSERT INTO Record (EmployeeID, TimeOut) VALUES (?,?);";
   $statement = $mysqli->prepare($query);
   $statement->bind_param("is", $data["EmployeeID"], $data["TimeOut"]);
   $statement->execute();
}
$newid = mysqli_insert_id($mysqli);
if (!($newid > $oldid))
{
   http_response_code(500); // set to Internal Server Error (500)
   echo "Something went wrong."; // error
   die();
}
else
{
   echo $newid;
}
/*$employeearr = array(); // make new array for the objects
while ($row = mysqli_fetch_assoc($result)) // while fetching each row
{
   array_push($employeearr, $row); // push it into array
}
echo json_encode($employeearr); // return json array of employees*/
?>