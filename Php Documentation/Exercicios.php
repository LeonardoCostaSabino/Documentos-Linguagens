<?php

include Func.php


    if($_POST["hugo"] == 7)
    echo "<br>Voce tentou!!";
    elseif($_POST["hugo"] == 9) {
      echo "não foi o suficiente";
    }
    else{
      echo "Desista";
    }

    if
?>

<!DOCTYPE html>
<html>
<body>

  <form method="post">

    Name: <input type="text" name="name"><br>
    E-mail: <input type="text" name="email"><br>

    <h3>Sobre sua condição natatória, pode-se dizer que você:</h3>
			não sabe nadar<input type="radio" name="vale" value="0"><br>
			nada com dificuldade<input type="radio" name="vale" value="1"><br>
			nada com estilo<input type="radio" name="vale" value="2"><br>
			é atleta<input type="radio" name="vale" value="3"><br>
    <h3> Teste de Leitura </h3>
      <input type="range" min="5" max="10" name="hugo" step="1">
      <input type="password" name="pass">

    <input type="submit">

  </form>



</body>
</html>
