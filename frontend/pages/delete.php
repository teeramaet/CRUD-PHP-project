<?php
    require_once('connect.php');
    $p_ID=$_GET["id"];
    $q="DELETE FROM progress WHERE ID='$p_ID';";
    $result=$mysqli->query($q);
    header("Location: congratPage.php"); 
?>