<?php
session_start();

require_once('connect.php');
$student_ID = $mysqli -> real_escape_string($_POST['id']);
$fullname = $mysqli -> real_escape_string($_POST['fullname']);
$password = $mysqli -> real_escape_string($_POST['password']);


$q2="SELECT Password FROM advisor where ID='$student_ID' and `name`='$fullname'";
$result2=$mysqli->query($q2);
$row2=$result2->fetch_array();

if(isset($result2)){
	$output="No username match";
	//redirect กลับหน้าloginใหม่
	header("Location: loginPage.html?m='".$output."'"); 
	}

 //wrong password
if($row2['Password']!==$password){
	$output="Wrong password".$password.$row2['Password'];
  //redirect กลับหน้าloginใหม่
	header("Location: loginPage.html?m=$output"); 
    }
 //correct password
if($row2['Password']==$password){
	$output="";
  //redirect ไปuserprofile
  	$_SESSION["user_ID"] = $student_ID;
	header("Location: requestPage.php?ID=$student_ID"); 
  //เอา username ส่งไปด้วย
    }
?>