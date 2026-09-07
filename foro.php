<?php

session_start();

$con = new mysqli("localhost", "root", "", "examen");

$sql = "SELECT 
            temas.id_tema,
            temas.titulo_tema,
            temas.seccion,
            COUNT(mensajes.id_mensaje) AS num_msj
        FROM temas
        LEFT JOIN mensajes
        ON temas.id_tema = mensajes.id_tema
        GROUP BY 
            temas.id_tema,
            temas.titulo_tema,
            temas.seccion
        ORDER BY temas.id_tema ASC";

$resultado = $con->query($sql);

?>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <link rel="stylesheet" href="styles.css?v=<?php echo time(); ?>">

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


<div class="foro">

    <h1>Temas del foro</h1>


    <?php

    foreach ($resultado as $tema) {

    ?>


        <div class="tema">


            <p class="seccion">

                <?php echo $tema["seccion"]; ?>

            </p>


            <h2>

                <a href="tema.php?id=<?php echo $tema["id_tema"]; ?>">

                    <?php echo $tema["titulo_tema"]; ?>

                </a>

            </h2>


            <p>

                Mensajes:
                <?php echo $tema["num_msj"]; ?>

            </p>


        </div>


    <?php

    }

    ?>


</div>


</body>

</html>