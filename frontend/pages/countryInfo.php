<?php require_once('connect.php'); 
?> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <link rel="stylesheet" href="countryInfoPageStyle.css" />
  <body>
    <nav class="navbar">
      <a class="contact">CONTACT</a>
      <a class="result">RESULT</a>
      <a class="country">COUNTRY</a>
      <a class="result">RESULT</a>
      <a class="country">COUNTRY</a>
      <a class="profile">PROFILE</a>
    </nav>
    <div class="content">
    <?php
    $universityID = $_GET['ID'];
        $q="select * from program p join university u on u.id = p.universityID WHERE u.id = universityID" ;
        $result=$mysqli->query($q);
                  if(!$result){
                    echo "Select failed. Error: ".$mysqli->error ;
                    return false;
                  }
                  $row = $result->fetch_array()?>
      <div class="left">
        <div class="up-left">
          <img
            src="<?= $row['image_URL'] ?>" 
            alt=""
          />
          <div class="text-group">
            <h3><?= $row['University_name'] ?></h3>
            <h3><?= $row['Country'] ?></h3>
            <h3><?= "GPA Requirement: ".$row['GPA_Requirement'] ?></h3>
            <h3><?= "English score: ".$row['Engscore_Requirement'] ?></h3>
          </div>
        </div>
        <div class="information">
          <p>
          <?= $row['Info'] ?>
          </p>
        </div>
      </div>
      <div class="right">
        <img
          src="<?= $row['image_URL1'] ?>" 
          alt=""
        />
        <img
          src="<?= $row['image_URL2'] ?>" 
        />

        <div class="add">
          <h5>Add</h5>
        </div>
      </div>
    </div>
  </body>
</html>
