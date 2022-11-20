<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="requestPageStyle.css" />
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
        <div class="description">
          <h1>Request</h1>
        </div>
        <div class="showResult">



          <?php 


          require_once('connect.php');
          $q="SELECT s.name,s.GPA,u.University_name,u.Mangaeby,p.id FROM student s Join progress p on s.Student_ID=p.Student_ID Join program pr on pr.Program_ID= p.Program_ID Join university u on u.ID =pr.universityID WHERE p.status=0 and u.Mangaeby<2;";
          $result=$mysqli->query($q);
          while($row=$result->fetch_array()){
                echo  "<div class='option'>";
                echo  "<a href='requestPageAccept.php?ProgressID=".$row['id']."'><h1>+</h1></a>";
                echo  "<div class='choice'>";
                echo      "<div class='request'>";
                echo          "<p class='choice-1'>".$row['name']."</p>";
                echo          "<p class='choice-1'><b>Grade: </b> ".$row['GPA']."</p>";
                echo          "<p class='choice-1'>";
                echo          "<b>Reason: </b> Lorem ipsum dolor, sit amet consectetur
                          adipisicing elit. Tempora, adipisci consequatur? Voluptas est
                          reiciendis tenetur esse nesciunt nostrum ex officia tempore.
                          Fugiat veniam ipsa atque minus sequi reiciendis, numquam
                          porro.
                          </p>";
                echo      "</div>";
                echo      "<p>".$row['University_name']."</p>";
                echo      "</div>";
                echo       "<a href='requestPageDeny.php?ProgressID=".$row['id']."'><h1>-</h1></a>";
                echo  "</div>"    ;

  }
          ?>
          


        </div>
      </div>
    </div>
  </body>
</html>
