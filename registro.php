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
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
</head>
<body>
<?php
include "componentes/menu.html";
$registroCorrecto = false;
$mensaje = "";
if ($_POST) {
    $nickname = $_POST["nickname"];
    $email = $_POST["email"];
    $pass = $_POST["pass"];
    $passHash = password_hash($pass, PASSWORD_DEFAULT);
    $con = new mysqli("");
    $sql = "SELECT email, nickname FROM usuarios";
    $resultado = $con->query($sql);
    $registrado = false;
    foreach ($resultado as $usuario) {
        if ($usuario["email"] == $email || $usuario["nickname"] == $nickname) {
            $registrado = true;
        }
    }
    if ($registrado == true) {
        $mensaje = "Ese usuario o email ya está registrado.";
    } else {
        $sql = "INSERT INTO usuarios (nickname, email, password) VALUES ('$nickname', '$email', '$passHash')";
        $resultado = $con->query($sql);
        if ($resultado == true) {
            $registroCorrecto = true;
        } else {
            $mensaje = "No se ha podido completar el registro. Inténtalo de nuevo.";
        }
    }
}
?>
<div class="regis">
    <?php
    if ($registroCorrecto == true) {
    ?>
        <div class="auth-heading">
            <p class="eyebrow">02 / IDENTIDAD CREADA</p>
            <h1>Usuario registrado.</h1>
            <p>Tu cuenta está lista. Inicia sesión para participar en NEON//FORUM.</p>
        </div>

        <div class="auth-heading">
            <p class="registro-link">
                <a href="login.php">Iniciar sesión →</a>
            </p>
        </div>
    <?php
    } else {
    ?>
        <div class="auth-heading">
            <p class="eyebrow">02 / NUEVA IDENTIDAD</p>
            <h1>Crea tu usuario</h1>
            <p>Un alias. Muchas cosas que compartir.</p>
        </div>
        <form action="registro.php" method="POST">
            <?php
            if ($mensaje != "") {
                echo "<p class='registro-aviso'>$mensaje</p>";
            }
            ?>
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
    <?php
    }
    ?>
</div>
</body>
</html>