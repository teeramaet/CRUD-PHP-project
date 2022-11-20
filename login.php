<?php
	require_once('connect.php');
	$student_ID = $_POST['id'];
	$fullname = $_POST['fullname'];
	$password = $_POST['password'];

	$sanitized_student_ID = mysqli_real_escape_string($db, $student_ID);
	$sanitized_fullname = mysqli_real_escape_string($db, $fullname);
	$sanitized_password = mysqli_real_escape_string($db, $password);

	$q="SELECT `Password` FROM `student` where student_ID='" 
    . $sanitized_student_ID . "' AND name = '" 
    . $sanitized_fullname . "'";
	$result=$mysqli_query($db, $sql)
		or die(mysqli_error($db));

	$num = mysqli_fetch_array($result);

	if($num > 0)
	{
		echo "Login Success";
	}
	else{
		echo "Wrong User id or password";
	}

	
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
	
    $q="SELECT `Password` FROM `advisor` where ID" 
    . $sanitized_student_ID . "' AND name = '" 
    . $sanitized_fullname . "'";
	$result=$mysqli_query($db, $sql)
		or die(mysqli_error($db));

	$num = mysqli_fetch_array($result);

	if($num > 0)
	{
		echo "Login Success";
	}
	else{
		echo "Wrong User id or password";
	}
	
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
		header("Location: requestPage.html?ID=$student_ID"); 
		//เอา username ส่งไปด้วย
    }

	
?>
