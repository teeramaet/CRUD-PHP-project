<?php
    session_start();
	require_once('connect.php');
	$Student_ID = $mysqli -> real_escape_string($_SESSION["user_ID"]) ;
    $fullname = $mysqli -> real_escape_string($_POST['fullname']);
    $gpa = $mysqli -> real_escape_string($_POST['GPA']);
    $eng = $mysqli -> real_escape_string($_POST['Eng_sco']);
    $npassword = $mysqli -> real_escape_string($_POST['npassword']);
    $opassword = $mysqli -> real_escape_string($_POST['opassword']);

	$q="SELECT * From Student WHERE password='$opassword' and Student_ID ='$Student_ID'";
    $result=$mysqli->query($q);
    
    if($result->num_rows != 1){
        //$message="Wrong password";
        header("Location: editProfilePage.html"); 
    }else{
    $q="UPDATE student
    SET Name='$fullname', Password='$npassword',GPA='$gpa',EngScore='$eng'
    where Student_ID='$Student_ID'";
    $result=$mysqli->query($q);
    if(!$result){
    echo "UPDATE failed. Error: ".$mysqli->error ;
    return false;
    }
    //redirect ไปไหน?
    //$message="success" ;
	header("Location: countryPage.php"); 
    }
	


	
?>
