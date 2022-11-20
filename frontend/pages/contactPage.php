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
  <link rel="stylesheet" href="contactPageStyle.css" />
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
      <div class="group">
        <div class="title"><h1>CONTACT US</h1></div>
        <?php
        $q="select * from advisor";
        $result=$mysqli->query($q);
                  if(!$result){
                    echo "Select failed. Error: ".$mysqli->error ;
                    return false;
                  }
        while($row = $result->fetch_array()){?>
          <div class="tileGroup">
          <div class="textGroup">
            <p> <?= $row['Region'] ?></p>
            <p> <?= $row['Name'] ?></p>
            <p> <?= "Position: ".$row[''] ?></p>
            <p> <?= "Tel: ".$row['Phone'] ?></p>
            <p> <?= "E-mail: ".$row['Email'] ?></p>
            <!-- <p>Position: Regional coordinator (Incoming and Outgoing)</p> -->
          </div>
          <img src="<?= $row['image_URL'] ?>" alt="" />
        </div>

       <?php }
        ?>
      </div>
    </div>
  </body>
</html>
