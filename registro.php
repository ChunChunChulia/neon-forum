<?php
session_start();

if (isset($_SESSION["usuario"])) {
    header("Location: login.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css?v=12">
    <title>Registro</title>
</head>

<body>

<?php

include "componentes/menu.html";

if ($_POST) {

    $nickname = $_POST["nickname"];
    $email = $_POST["email"];
    $pass = $_POST["pass"];

    $passHash = password_hash($pass, PASSWORD_DEFAULT);

    $con = new mysqli("localhost", "root", "", "examen");

    $sql = "SELECT email, nickname FROM usuarios";
    $resultado = $con->query($sql);

    $registrado = false;

    foreach ($resultado as $usuario) {

        if ($usuario["email"] == $email || $usuario["nickname"] == $nickname) {
            $registrado = true;
        }

    }

    if ($registrado == true) {

        echo "Ese usuario o email ya está registrado";

    } else {

        $sql = "INSERT INTO usuarios (nickname, email, password)
                VALUES ('$nickname', '$email', '$passHash')";

        $con->query($sql);

        echo "Usuario registrado correctamente";
    }
}

?>

<div class="regis">
    <h1>Crea tu usuario</h1>

    <form action="registro.php" method="POST">

        <label for="nickname">Nickname</label>
        <input
            type="text"
            id="nickname"
            name="nickname"
            placeholder="Inserta tu nickname"
            required
        ><br>

        <label for="email">Email</label>
        <input
            type="email"
            id="email"
            name="email"
            placeholder="Inserta tu email"
            required
        ><br>

        <label for="pass">Password</label>
        <input
            type="password"
            id="pass"
            name="pass"
            placeholder="Inserta tu contraseña"
            required
        ><br>

        <input type="submit" value="Registrarme">

    </form>
</div>

</body>
</html>