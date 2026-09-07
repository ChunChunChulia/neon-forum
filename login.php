<?php
session_start();

if (isset($_SESSION["usuario"])) {
    header("Location: index.php");
    exit;
}

if ($_POST) {

    $email = $_POST["email"];
    $pass = $_POST["pass"];

    $con = new mysqli("localhost", "root", "", "examen");

    $sql = "SELECT email, nickname, password FROM usuarios";
    $resultado = $con->query($sql);

    $encontrado = false;

    foreach ($resultado as $usuario) {

        if ($usuario["email"] == $email) {

            $encontrado = true;

            if (password_verify($pass, $usuario["password"])) {

                $_SESSION["usuario"] = $usuario["nickname"];

                header("Location: index.php");
                exit;

            } else {

                $error = "Contraseña incorrecta";

            }
        }
    }

    if ($encontrado == false) {
        $error = "Ese usuario no existe";
    }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Login</title>
</head>

<body>

    <?php
    include "componentes/menu.html";
    ?>

    <?php
    if (isset($error)) {
        echo '<p class="alert">' . $error . '</p>';
    }
    ?>

    <div class="login">

        <h1>Inicia sesión</h1>

        <form action="login.php" method="POST">

            <label for="email">Email</label>
            <input
                type="email"
                id="email"
                name="email"
                placeholder="Inserta tu email"
                required
            >

            <label for="pass">Password</label>
            <input
                type="password"
                id="pass"
                name="pass"
                placeholder="Inserta tu contraseña"
                required
            >

            <input type="submit" value="Entrar">

        </form>

        <p class="registro-link">
            ¿Todavía no tienes cuenta?
            <a href="registro.php">Crear una cuenta</a>
        </p>

    </div>

</body>
</html>