<?php

require'config.php';

if(isset($_POST["update"])) {
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $number = $_POST["number"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $pwd = $_POST["pwd"];
    $dob = $_POST["dob"];

    $sql = " UPDATE INTO 
    registeredUser(firstName, lastName contactNo, email, adress, password, dob)
    VALUES('$fname', '$lname', '$number', '$email', '$address', '$pwd', '$dob') ";

    if($con->query($sql)) {
        echo "Saved!";
    }

}

if(isset($_POST["delete"])) {
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $number = $_POST["number"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $pwd = $_POST["pwd"];
    $dob = $_POST["dob"];

    $sql = " DELETE INTO 
    registeredUser(firstName, lastName contactNo, email, adress, password, dob)
    VALUES('$fname', '$lname', '$number', '$email', '$address', '$pwd', '$dob') ";

    if($con->query($sql)) {
        echo "Deleted!";
    }

}

?>