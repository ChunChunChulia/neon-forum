<?php
session_start();
$con = new mysqli("");
$seccionElegida = "";
if (isset($_GET["seccion"])) {
    $seccionElegida = $_GET["seccion"];
}
if ($seccionElegida == "") {
    $sql = "SELECT DISTINCT seccion FROM temas";
} else {
    $sql = "SELECT * FROM temas";
}
$resultado = $con->query($sql);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css?v=<?php echo time(); ?>">
    <title>Foro</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
</head>
<body>
<?php
if (isset($_SESSION["usuario"])) {
    include "componentes/menu2.html";
} else {
    include "componentes/menu.html";
}
?>
<div class="foro">
    <p class="eyebrow">NEON//FORUM · Índice de conversaciones</p>
    <?php
    if ($seccionElegida == "") {
    ?>
        <h1>Secciones del foro<span class="title-dot" aria-hidden="true">.</span></h1>
    <?php
    } else {
    ?>
        <h1><?php echo htmlspecialchars($seccionElegida, ENT_QUOTES, "UTF-8"); ?><span class="title-dot" aria-hidden="true">.</span></h1>
        <a href="foro.php" class="b1">Volver a las secciones</a>
    <?php
    }
    if (isset($_SESSION["usuario"])) {
    ?>
        <a href="crear-tema.php" class="b1">Crear tema</a>
    <?php
    }
    if ($seccionElegida == "") {
        foreach ($resultado as $categoria) {
            if ($categoria["seccion"] != "") {
    ?>
                <form action="foro.php" method="GET" class="tema">
                    <p class="seccion">Sección</p>
                    <h2><?php echo htmlspecialchars($categoria["seccion"], ENT_QUOTES, "UTF-8"); ?></h2>
                    <button type="submit" name="seccion" value="<?php echo htmlspecialchars($categoria["seccion"], ENT_QUOTES, "UTF-8"); ?>" class="b1">Ver temas</button>
                </form>
    <?php
            }
        }
    } else {
        $hayTemas = false;
        foreach ($resultado as $tema) {
            if ($tema["seccion"] == $seccionElegida) {
                $hayTemas = true;
                $autor = "";
                if ($tema["id_usu"] != NULL) {
                    $id_usu = $tema["id_usu"];
                    $sql = "SELECT nickname FROM usuarios WHERE id_usu = $id_usu";
                    $resultadoUsuario = $con->query($sql);
                    foreach ($resultadoUsuario as $usuario) {
                        $autor = $usuario["nickname"];
                    }
                }
                $id_tema = $tema["id_tema"];
                $sql = "SELECT id_mensaje FROM mensajes WHERE id_tema = $id_tema";
                $resultadoMensajes = $con->query($sql);
                $num_msj = 0;
                foreach ($resultadoMensajes as $mensaje) {
                    $num_msj++;
                }
    ?>
                <div class="tema">
                    <p class="seccion"><?php echo htmlspecialchars($tema["seccion"], ENT_QUOTES, "UTF-8"); ?></p>
                    <h2>
                        <a href="tema.php?id=<?php echo $tema["id_tema"]; ?>"><?php echo htmlspecialchars($tema["titulo_tema"], ENT_QUOTES, "UTF-8"); ?></a>
                    </h2>
                    <p class="tema-datos">
                        <?php
                        if ($autor != "") {
                        ?>
                            <span class="count-label">Por <?php echo htmlspecialchars($autor, ENT_QUOTES, "UTF-8"); ?></span>
                        <?php
                        }
                        ?>
                        <span>
                            <strong class="message-count"><?php echo $num_msj; ?></strong>
                            <span class="count-label">mensajes</span>
                        </span>
                    </p>
                </div>
    <?php
            }
        }
        if ($hayTemas == false) {
    ?>
            <p>No hay temas en esta sección.</p>
    <?php
        }
    }
    ?>
</div>
</body>
</html>