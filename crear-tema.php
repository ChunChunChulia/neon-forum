<?php
session_start();
if (isset($_SESSION["usuario"])) {
    $usuarioSesion = $_SESSION["usuario"];
} else {
    header("Location: login.php");
    exit;
}
$con = new mysqli("");
$error = "";
$titulo = "";
$seccion = "";
$mensaje = "";
if (isset($_POST["titulo"]) && isset($_POST["seccion"]) && isset($_POST["mensaje"])) {
    $titulo = trim($_POST["titulo"]);
    $seccion = trim($_POST["seccion"]);
    $mensaje = trim($_POST["mensaje"]);
    if ($titulo == "" || $seccion == "" || $mensaje == "") {
        $error = "Completa el título, la sección y el mensaje.";
    } else {
        $mi_id = 0;
        $sql = "SELECT id_usu, nickname FROM usuarios";
        $resultadoUsuario = $con->query($sql);
        foreach ($resultadoUsuario as $usuario) {
            if ($usuario["nickname"] == $usuarioSesion) {
                $mi_id = $usuario["id_usu"];
            }
        }
        if ($mi_id == 0) {
            $error = "No se ha encontrado tu usuario. Vuelve a iniciar sesión.";
        } else {
            $sql = "INSERT INTO temas (titulo_tema, seccion, id_usu) VALUES (?, ?, ?)";
            $consultaTema = $con->prepare($sql);  // Prepara la consulta con los ?
            $consultaTema->bind_param("ssi", $titulo, $seccion, $mi_id);// Asocia las variables a los ?, en orden
            if ($consultaTema->execute()) {// Ejecuta la consulta y guarda el mensaje
                $id_tema = $con->insert_id;
                $sql = "INSERT INTO mensajes (titulo_mensaje, mensaje, id_usu, id_tema) VALUES ('Inicio', ?, ?, ?)";
                $consultaMensaje = $con->prepare($sql);
                $consultaMensaje->bind_param("sii", $mensaje, $mi_id, $id_tema);
                if ($consultaMensaje->execute()) {
                    header("Location: tema.php?id=$id_tema");
                    exit;
                } else {
                    $sql = "DELETE FROM temas WHERE id_tema = $id_tema AND id_usu = $mi_id";
                    $con->query($sql);
                    $error = "No se ha podido guardar el primer mensaje.";
                }
            } else {
                $error = "No se ha podido crear el tema.";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css?v=<?php echo time(); ?>">
    <title>Crear tema</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
</head>
<script src="editor.js"></script>
<body>
<?php
include "componentes/menu2.html";
?>
<div class="regis">
    <div class="auth-heading">
        <p class="eyebrow">NEON//FORUM · NUEVA CONVERSACIÓN</p>
        <h1>Crea un tema.</h1>
        <p>Abre una conversación con la comunidad.</p>
    </div>
    <form action="crear-tema.php" method="POST">
        <?php
        if ($error != "") {
            echo "<p class='registro-aviso'>$error</p>";
        }
        ?>
        <label for="titulo">Título del tema</label>
        <input type="text" id="titulo" name="titulo" placeholder="¿De qué quieres hablar?" value="<?php echo htmlspecialchars($titulo, ENT_QUOTES, "UTF-8"); ?>" required>
        <label for="seccion">Sección</label>
        <input type="text" id="seccion" name="seccion" placeholder="Escribe la sección" value="<?php echo htmlspecialchars($seccion, ENT_QUOTES, "UTF-8"); ?>" required>
        <label for="mensaje">Primer mensaje</label>
        <textarea id="mensaje" name="mensaje" placeholder="Empieza la conversación..." required><?php echo htmlspecialchars($mensaje, ENT_QUOTES, "UTF-8"); ?></textarea>
        <input type="submit" value="Crear tema">
    </form>
</div>
</body>
</html>