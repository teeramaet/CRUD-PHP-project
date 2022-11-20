<?php
	require_once('connect.php');
	$student_ID = $_POST['id'];
	$fullname = $_POST['fullname'];
	$password = $_POST['password'];

	$q="SELECT `Password` FROM `student` where student_ID='$student_ID' and `name`='$fullname'";
	$result=$mysqli->query($q);
	$row=$result->fetch_array();

	
	//no username
	if(!$result){
		$output="No username match";
		//redirect กลับหน้าloginใหม่
		header("Location: loginPage.html"); 
    }
	//wrong password
	if($row['Password']!=$password){
		$output="Wrong password";
		//redirect กลับหน้าloginใหม่
		header("Location: loginPage.html"); 
    }
	//correct password
	if($row['Password']!=$pass){
		$output="";
		//redirect ไปuserprofile
		header("Location: homePage.html?student_ID=$student_ID"); 
		//เอา username ส่งไปด้วย
    }
	
	$q="SELECT `Password` FROM `advisor` where ID='$ID' and `name`='$name'";
	$result=$mysqli->query($q);
	$row=$result->fetch_array();
	
	//no username
	if(!$result){
		$output="No username match";
		//redirect กลับหน้าloginใหม่
		header("Location: loginPage.html"); 
    }
	//wrong password
	if($row['Password']!=$password){
		$output="Wrong password";
		//redirect กลับหน้าloginใหม่
		header("Location: loginPage.html"); 
    }
	//correct password
	if($row['Password']!=$pass){
		$output="";
		//redirect ไปuserprofile
		header("Location: requestPage.html?student_ID=$student_ID"); 
		//เอา username ส่งไปด้วย
    }

	
?>
