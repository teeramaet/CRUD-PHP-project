<?php
$progressID=$_GET["ProgressID"];
echo $progressID;
require_once('connect.php');
$q="UPDATE progress
SET status=1
WHERE ID='$progressID'";
$result=$mysqli->query($q);
if(!$result){
    echo "UPDATE failed. Error: ".$mysqli->error ;
    return false;
}
header("Location: requestPage.php"); 

?>