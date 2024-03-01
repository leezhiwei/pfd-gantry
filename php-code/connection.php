<?php
$host = "localhost";
$user = "root"; # change these params (root not safe)
$password = "";
$db = "datacollection_1";
$mysqli=mysqli_connect($host,$user,$password,$db);
if(!$mysqli)
    die('Connect Error');
?>