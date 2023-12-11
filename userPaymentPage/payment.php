<?php

require'config.php';

if(isset($_POST["pay"])) {
    $bname = $_POST["bname"];
    $ctype = $_POST["ctype"];
    $bemail = $_POST["bemail"];
    $cname = $_POST["cname"];
    $baddress = $_POST["baddress"];
    $cnumber = $_POST["cnumber"];
    $year = $_POST["year"];
    $month = $_POST["month"];
    $cvv = $_POST["cvv"];

    $sql = " INSERT INTO 
    paymentDetails(paymentName, cardType, paymentEmail, cardHolder, billingAdress, cardNo, expireYear, expireMonth, cvv)
    VALUES('$bname', '$ctype', '$bemail', '$cname', '$baddress', '$cnumber', '$year', '$month', '$cvv') ";

    if($con->query($sql)) {
        echo "Succesfull!";
    }

}

?>