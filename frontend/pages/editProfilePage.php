<?php
	require_once('connect.php');
	$Student_ID = $_POST['ID'];
    $fullname = $_POST['fullname'];
    $npassword = $_POST['npassword'];
    $cpassword = $_POST['cpassword'];

	$q="SELECT * From Student WHERE password='$cpassword' and Student_ID ='$Student_ID'";
    $result=$mysqli->query($q);
    print $result->num_rows;
    if($result->num_rows != 1){
        //$message="Wrong password";
        header("Location: editProfilePage.html"); 
    }

    $q="UPDATE student
    SET Name='$fullname', Password='$npassword'
    where Student_ID='$Student_ID'";
    $result=$mysqli->query($q);
    if(!$result){
    echo "UPDATE failed. Error: ".$mysqli->error ;
    return false;
    }
    //redirect ไปไหน?
    //$message="success" ;
	header("Location: editProfilePage.html"); 
	
	


	
?>
