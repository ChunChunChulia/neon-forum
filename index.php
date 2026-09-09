<?php
session_start();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" type="image/svg+xml" href="favicon.svg">

    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.js"
        integrity="sha512-jx7pKV1OCCwD8nJVKETycdimr+xPg3VCP0Wc5tX0RdpusPKEC72eB5cyqgT48K5HxbXvbxIc/oDVb70QMhSeLw=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer">
        
    </script>

    <title>Foro</title>
</head>

<body>

    <?php
    if (isset($_SESSION["usuario"])) {
        include "componentes/menu2.html";
    } else {
        include "componentes/menu.html";
    }
    ?>

    <div class="bienv">
        <p class="eyebrow">Cultura digital · Conversaciones humanas</p>
        <h1><span class="welcome">Bienvenid@ a</span> NEON<span class="slashes">//</span><span class="word-forum">FORUM</span></h1>

        <p>
            Un rincón para hablar de videojuegos, inteligencia artificial,
            arte digital, tecnología, cultura de internet y todas esas cosas
            extrañas que aparecen cuando llevas demasiado tiempo conectado.
        </p>

        <p>
            Comparte proyectos, descubre herramientas, recomienda juegos,
            enseña lo que estás creando o abre un hilo sobre esa obsesión
            digital que nadie de tu entorno entiende.
        </p>

        <p>No hace falta ser experto en nada. Solo tener curiosidad.</p>

        <p>Entra, publica y haz un poco de ruido.</p>
    </div>

    <?php
    if (isset($_SESSION["usuario"])) {
        echo '<div class="tabla"></div>';
    } else {
        echo '
            <div class="cta">
                <p>
                    ¿Todavía no formas parte de la comunidad?
                    Crea tu cuenta, únete a las conversaciones y empieza a publicar.
                </p>

                <a href="registro.php" class="b1">Crear una cuenta</a>
            </div>
        ';
    }
    ?>

</body>
</html>