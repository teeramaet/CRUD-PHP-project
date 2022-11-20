<?php
    session_start();
    require_once('connect.php');
    $u_ID=$_POST["id"];
    $p_ID=$_POST["p_ID"];
    $acb=$_POST["acb"];
    $essay=$_POST["essay"];
    $student_ID=$_SESSION["user_ID"] ;
    $q="INSERT INTO progress (`Status`, `Student_ID`, `university_ID`, `Program_ID`, `Approveby`, `essay`)
    value(0,'$student_ID','$u_ID','$p_ID','$acb','$essay')";
    $result=$mysqli->query($q);
    header("Location: congratPage.php"); 
?>