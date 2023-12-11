<?php

require'config.php';

if(isset($_POST["register"])) {
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $number = $_POST["number"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $pwd = $_POST["pwd"];
    $dob = $_POST["dob"];

    $sql = " INSERT INTO 
    registeredUser(firstName, lastName contactNo, email, adress, password, dob)
    VALUES('$fname', '$lname', '$number', '$email', '$address', '$pwd', '$dob') ";

    if($con->query($sql)) {
        echo "Successfull!";
    }

}

?>