<?php
	require_once('connect.php');


    $Student_ID = $mysqli -> real_escape_string($_POST['ID']);
	$Username = $mysqli -> real_escape_string($_POST['fullname']);
	$Password = $mysqli -> real_escape_string($_POST['password']);
	$Cpassword = $mysqli -> real_escape_string($_POST['cpassword']);


	//เช็คว่าIDซ้ำมั้ย
	$q="SELECT Student_ID FROM student WHERE Student_ID = '$Student_ID'";
	$result=$mysqli->query($q);
	if($result){
		header("Location: createAccountPage.html"); 
	}

	//เช็คว่าpass and cpass เหมือนกันมั้ย
	if($Password != $Cpassword){
		header("Location: createAccountPage.html"); 
	}
	
	header("Location: loginPage.html"); 
	$q="INSERT INTO student (Student_ID,name,Password) 
		VALUES ('$Student_ID','$Username','$Password')";
	$result=$mysqli->query($q);
	if(!$result){
		echo "INSERT failed. Error: ".$mysqli->error ;
		return false;
	}
	header("Location: loginPage.html"); 
?>
