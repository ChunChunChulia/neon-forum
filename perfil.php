<?php
session_start();

if (!isset($_SESSION["usuario"])) {
    header("Location: login.php");
    exit;
}

$con = new mysqli("localhost", "root", "", "examen");
$nicknameSesion = $_SESSION["usuario"];

/* DATOS DEL USUARIO */

$sql = "SELECT * FROM usuarios WHERE nickname = '$nicknameSesion'";
$resultadoUsuario = $con->query($sql);

foreach ($resultadoUsuario as $usuario) {
    $id_usu = $usuario["id_usu"];
    $nickname = $usuario["nickname"];
    $email = $usuario["email"];
    $avatar = $usuario["avatar"];
    $firma = $usuario["firma"];
}

/* CAMBIAR AVATAR */

if (isset($_POST["cambiar_avatar"])) {

    if (isset($_FILES["avatar"])) {

        $nombreOriginal = $_FILES["avatar"]["name"];
        $temporal = $_FILES["avatar"]["tmp_name"];

        $extension = strtolower(pathinfo($nombreOriginal, PATHINFO_EXTENSION));

        if ($extension == "jpg" || $extension == "jpeg" || $extension == "png" || $extension == "webp") {

            $nuevoNombre = "avatar_" . $id_usu . "_" . time() . "." . $extension;
            $ruta = "avatars/" . $nuevoNombre;

            move_uploaded_file($temporal, $ruta);

            $sql = "UPDATE usuarios SET avatar = '$nuevoNombre' WHERE id_usu = $id_usu";
            $con->query($sql);

            header("Location: perfil.php");
            exit;

        } else {
            $errorAvatar = "Formato de imagen no válido";
        }
    }
}

/* GUARDAR FIRMA */

if (isset($_POST["guardar_firma"])) {

    $firmaNueva = $con->real_escape_string($_POST["firma"]);

    $sql = "UPDATE usuarios SET firma = '$firmaNueva' WHERE id_usu = $id_usu";
    $con->query($sql);

    header("Location: perfil.php");
    exit;
}

/* MENSAJES DEL USUARIO */

$sql = "SELECT * FROM mensajes WHERE id_usu = $id_usu";
$resultadoMensajes = $con->query($sql);

$num_mensajes = $resultadoMensajes->num_rows;

/* ACTIVIDAD DEL USUARIO */

$sql = "SELECT mensajes.id_mensaje, mensajes.mensaje, mensajes.id_tema, temas.titulo_tema FROM mensajes INNER JOIN temas ON mensajes.id_tema = temas.id_tema WHERE mensajes.id_usu = $id_usu ORDER BY mensajes.id_mensaje DESC";
$actividad = $con->query($sql);

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css?v=<?php echo time(); ?>">
    <title>Perfil de <?php echo $nickname; ?></title>
</head>

<body>

<?php include "componentes/menu2.html"; ?>

<div class="perfil">

    <p class="perfil-tag">USER_PROFILE</p>

    <h1><?php echo $nickname; ?></h1>

    <div class="perfil-datos">

        <div class="dato">
            <span>Nickname</span>
            <p><?php echo $nickname; ?></p>
        </div>

        <div class="dato">
            <span>Email</span>
            <p><?php echo $email; ?></p>
        </div>

        <div class="dato">
            <span>Mensajes publicados</span>
            <p><?php echo $num_mensajes; ?></p>
        </div>

    </div>

    <div class="perfil-avatar">

        <?php if ($avatar != NULL && $avatar != "") { ?>

            <img src="avatars/<?php echo $avatar; ?>" alt="Avatar de <?php echo $nickname; ?>" class="avatar-img">

        <?php } else { ?>

            <div class="avatar-vacio">
                <?php echo strtoupper(substr($nickname, 0, 1)); ?>
            </div>

        <?php } ?>

        <form action="perfil.php" method="POST" enctype="multipart/form-data" class="avatar-form">

            <label for="avatar">Cambiar avatar</label>

            <input type="file" name="avatar" id="avatar" accept=".jpg,.jpeg,.png,.webp" required>

            <button type="submit" name="cambiar_avatar">Subir avatar</button>

        </form>

        <?php
        if (isset($errorAvatar)) {
            echo '<p class="alert">' . $errorAvatar . '</p>';
        }
        ?>

    </div>

    <div class="firma-perfil">

        <h2>Firma</h2>

        <p class="firma-info">Esta firma aparecerá debajo de tus mensajes.</p>

        <form action="perfil.php" method="POST">

            <label for="firma">Tu firma</label>
            <textarea id="firma" name="firma" maxlength="500" placeholder="Escribe tu firma..."><?php echo $firma; ?></textarea>

            <button type="submit" name="guardar_firma">Guardar firma</button>

        </form>

    </div>

    <div class="actividad">

        <h2>Tu actividad</h2>

        <?php

        if ($actividad->num_rows > 0) {

            foreach ($actividad as $mensaje) {

        ?>

                <div class="actividad-mensaje">

                    <p class="actividad-tema">
                        <a href="tema.php?id=<?php echo $mensaje["id_tema"]; ?>">
                            <?php echo $mensaje["titulo_tema"]; ?>
                        </a>
                    </p>

                    <p><?php echo $mensaje["mensaje"]; ?></p>

                </div>

        <?php

            }

        } else {

            echo '<p class="sin-actividad">Todavía no has publicado ningún mensaje.</p>';

        }

        ?>

    </div>

</div>

</body>
</html>