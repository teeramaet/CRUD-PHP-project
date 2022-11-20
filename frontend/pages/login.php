<?php
	session_start();


	require_once('connect.php');
	$firstname = $mysqli -> real_escape_string($_POST['firstname']);
	$lastname = $mysqli -> real_escape_string($_POST['lastname']);
	$age = $mysqli -> real_escape_string($_POST['age']);
	$student_ID = $mysqli -> real_escape_string($_POST['id']);
	$fullname = $mysqli -> real_escape_string($_POST['fullname']);
	$password =  $mysqli -> real_escape_string($_POST['password']);
	
	$q="SELECT Password FROM student where student_ID='$student_ID' and `name`='$fullname'";
	$result=$mysqli->query($q);
	$row=$result->fetch_array();
	
	
	 //no username
	if(isset($result)){
		$output="No username match";
	  //redirect กลับหน้าloginใหม่
		header("Location: loginPage.html?m=$output"); 
		}
	 //wrong password
	if($row['Password']!=$password){
		$output="Wrong password is".$row['Password'];
	  //redirect กลับหน้าloginใหม่
		header("Location: loginPage.html?m=$output"); 
		}
	 //correct password
	if($row['Password']==$password){
	  //redirect ไปuserprofile
		  $_SESSION["user_ID"] = $student_ID;
		header("Location: countryPage.php?student_ID=$student_ID"); 
	  //เอา username ส่งไปด้วย
		}

	
?>
