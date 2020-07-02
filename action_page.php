<?php

if($_POST["submit"]) {
    $recipient="zlopez3@gmail.address";
    $subject="new website message";
    $sender=$_POST["Name"];
    $senderEmail=$_POST["Email"];
    $message=$_POST["Message"];

    $mailBody="Name: $sender\nEmail: $senderEmail\n\n$message";

    mail($recipient, $subject, $mailBody, "From: $sender <$senderEmail>");

    $thankYou="<p>Thank you! Your message has been sent.</p>";
}

