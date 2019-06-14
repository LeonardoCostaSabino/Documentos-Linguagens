<?php

function form(){
  if(!empty($_POST["name"])){
    echo "Ola ".$_POST["name"];
  }
  if($_POST["vale"] == 3)
    echo "<br>Voce tem uma ótima condição atletica";
}



?>
