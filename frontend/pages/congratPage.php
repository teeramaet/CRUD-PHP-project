<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="congratPageStyle.css" />
  </head>
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
        <div class="pic-1"></div>
        <div class="description">
          <h1>YOUR RESULT</h1>
        </div>
        <?php
        require_once('connect.php');
        $q="SELECT u.University_name,p.status from progress p join university u on u.id = p.university_ID";
        $result=$mysqli->query($q);
        if(!$result){
          echo "Select failed. Error: ".$mysqli->error ;
            return false;
          }
        $x=1;
        if ($result->num_rows != 0){
        echo "<div class='showResult'>";
        while($row = $result->fetch_array()){
        $color='white';
        if($row['status']==1){
          $color='lightgreen';
        }
        if($row['status']==2){
          $color='red';
          
        }
        echo "<div class='choice' style='background-color:".$color."'>";
       
        echo    "<p class='choice-1' >choice "."$x".": ".$row['University_name']."</p>";
        echo  "</div>";
        
        $x++;
        }
        }else{
          echo "<div class='showResult'>";
          echo "<div class='choice'>";
          echo    "<p class='choice-1'>No choice selected</p>";
          echo  "</div>";
          echo "</div>";
        }
        ?>
          </div>
      </div>
    </div>
  </body>
</html>
