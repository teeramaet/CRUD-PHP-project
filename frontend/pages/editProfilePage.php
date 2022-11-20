<?php
    session_start();
	require_once('connect.php');
	$Student_ID = $_SESSION["user_ID"] ;
    $fullname = $_POST['fullname'];
    $gpa = $_POST['GPA'];
    $eng = $_POST['Eng_sco'];
    $npassword = $_POST['npassword'];
    $opassword = $_POST['opassword'];

	require_once('connect.php');
    
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
