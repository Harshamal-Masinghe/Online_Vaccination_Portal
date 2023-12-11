<?php

$con = new mysqli("localhost", "root", "", "vaccine_db");

if($con->connect_error) {
    die("Connection failed!".$con->connect_error);
}
else {
    echo"Connected!";
}

?>