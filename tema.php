<?php

session_start();

$con = new mysqli("localhost", "root", "", "examen");

$id_tema = $_GET["id"];


/* BUSCAMOS EL TEMA */

$sql = "SELECT * FROM temas WHERE id_tema = $id_tema";
$resultadoTema = $con->query($sql);

foreach ($resultadoTema as $tema) {

    $titulo = $tema["titulo_tema"];
    $seccion = $tema["seccion"];

}


/* BUSCAMOS EL ID DEL USUARIO CONECTADO */

if (isset($_SESSION["usuario"])) {

    $usuarioSesion = $_SESSION["usuario"];

    $sql = "SELECT id_usu FROM usuarios
            WHERE nickname = '$usuarioSesion'";

    $resultadoUsuario = $con->query($sql);

    foreach ($resultadoUsuario as $usuario) {

        $mi_id = $usuario["id_usu"];

    }

}


/* BORRAR MENSAJE */

if (isset($_POST["borrar"])) {

    if (isset($_SESSION["usuario"])) {

        $id_mensaje = $_POST["id_mensaje"];

        /* SOLO BORRA SI EL MENSAJE ES DEL USUARIO CONECTADO */

        $sql = "DELETE FROM mensajes
                WHERE id_mensaje = $id_mensaje
                AND id_usu = $mi_id";

        $con->query($sql);

        header("Location: tema.php?id=$id_tema");
        exit;

    }

}


/* PUBLICAR RESPUESTA */

if (isset($_POST["mensaje"])) {

    if (isset($_SESSION["usuario"])) {

        $mensajeNuevo = $_POST["mensaje"];

        $sql = "INSERT INTO mensajes
                (titulo_mensaje, mensaje, id_usu, id_tema)
                VALUES
                ('Respuesta', '$mensajeNuevo', $mi_id, $id_tema)";

        if ($con->query($sql)) {

            header("Location: tema.php?id=$id_tema");
            exit;

        } else {

            echo "ERROR: " . $con->error;

        }

    }

}


/* BUSCAMOS LOS MENSAJES DEL TEMA */

$sql = "SELECT * FROM mensajes
        WHERE id_tema = $id_tema";

$mensajes = $con->query($sql);

?>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <link rel="stylesheet" href="styles.css?v=12">

    <title>
        <?php echo $titulo; ?>
    </title>

</head>


<body>


<?php

if (isset($_SESSION["usuario"])) {

    include "componentes/menu2.html";

} else {

    include "componentes/menu.html";

}

?>


<div class="pagina-tema">


    <p class="seccion">

        <?php echo $seccion; ?>

    </p>


    <h1>

        <?php echo $titulo; ?>

    </h1>


    <div class="mensajes">


        <?php

        foreach ($mensajes as $mensaje) {

            $id_usu = $mensaje["id_usu"];


            /* BUSCAMOS EL NOMBRE, AVATAR Y FIRMA DEL AUTOR */

            $sql = "SELECT nickname, avatar, firma
                    FROM usuarios
                    WHERE id_usu = $id_usu";

            $resultadoUsuario = $con->query($sql);

            $nickname = "Usuario";
            $avatar = "";
            $firma = "";

            foreach ($resultadoUsuario as $usuario) {

                $nickname = $usuario["nickname"];
                $avatar = $usuario["avatar"];
                $firma = $usuario["firma"];

            }

        ?>


            <div class="mensaje">


                <div class="autor">

                    <?php if ($avatar != NULL && $avatar != "") { ?>

                        <img
                            src="avatars/<?php echo htmlspecialchars($avatar, ENT_QUOTES, "UTF-8"); ?>"
                            alt=""
                            class="avatar-img"
                            width="64"
                            height="64"
                            loading="lazy"
                        >

                    <?php } else { ?>

                        <div class="avatar-vacio" aria-hidden="true"><?php echo htmlspecialchars(strtoupper(substr($nickname, 0, 1)), ENT_QUOTES, "UTF-8"); ?></div>

                    <?php } ?>

                    <p class="autor-nombre"><?php echo htmlspecialchars($nickname, ENT_QUOTES, "UTF-8"); ?></p>

                </div>


                <p class="mensaje-texto">

                    <?php echo $mensaje["mensaje"]; ?>

                </p>


                <?php

                /* SOLO MOSTRAMOS BORRAR SI EL MENSAJE ES NUESTRO */

                if (isset($_SESSION["usuario"])) {

                    if ($mensaje["id_usu"] == $mi_id) {

                ?>


                        <form
                            action="tema.php?id=<?php echo $id_tema; ?>"
                            method="POST"
                            class="borrar-mensaje"
                        >

                            <input
                                type="hidden"
                                name="id_mensaje"
                                value="<?php echo $mensaje["id_mensaje"]; ?>"
                            >

                            <button
                                type="submit"
                                name="borrar"
                            >
                                Borrar
                            </button>

                        </form>


                <?php

                    }

                }

                ?>

                <?php if ($firma != NULL && trim($firma) != "") { ?>

                    <p class="firma"><?php echo htmlspecialchars($firma, ENT_QUOTES, "UTF-8"); ?></p>

                <?php } ?>

            </div>


        <?php

        }

        ?>


    </div>


    <?php

    if (isset($_SESSION["usuario"])) {

    ?>


        <div class="respuesta">

            <h2>Responder</h2>

            <form
                action="tema.php?id=<?php echo $id_tema; ?>"
                method="POST"
            >

                <label for="respuesta-mensaje">Tu mensaje</label>
                <textarea
                    id="respuesta-mensaje"
                    name="mensaje"
                    placeholder="Escribe tu respuesta..."
                    required
                ></textarea>

                <input
                    type="submit"
                    value="Publicar respuesta"
                >

            </form>

        </div>


    <?php

    } else {

    ?>


        <div class="cta">

            <p>
                Inicia sesión para participar en esta conversación.
            </p>

            <a href="login.php" class="b1">
                Iniciar sesión
            </a>

        </div>


    <?php

    }

    ?>


</div>


</body>

</html>