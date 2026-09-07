-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2026 a las 21:18:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id_mensaje` int(11) NOT NULL,
  `titulo_mensaje` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `id_usu` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id_mensaje`, `titulo_mensaje`, `mensaje`, `id_usu`, `id_tema`) VALUES
(1, 'Re: RPG favorito', 'FFIX para siempre (´｡• ᵕ •｡`) ♡ Me parece imposible separar ese juego de la música, los personajes y esa sensación de aventura. Y Vivi T_T', 1, 1),
(2, 'Una elección clásica', 'No sé si será una elección muy original, pero me quedo con Planescape: Torment. Siempre he preferido los juegos que tienen algo interesante que contar a los que se limitan a sumar estadísticas.', 2, 1),
(3, 'Re: RPG favorito', 'Persona 5. Dirección artística increíble, interfaz increíble y sabe perfectamente cuál es su identidad. Como producto está cuidadísimo.', 7, 1),
(4, 'Re: RPG favorito', 'Yo aquí voy a ejercer de profesor y decir que antes de elegir el mejor habría que definir los criterios 😄 Historia, mecánicas, diseño, influencia... si no, esto no es metodológicamente serio.', 9, 1),
(5, 'Re: RPG favorito', 'Yo entré aquí sin conocimientos de programación y salgo descubriendo que también tengo que defender Chrono Trigger. Qué curso tan exigente xDDD', 5, 1),
(6, 'Re: RPG favorito', 'NieR Automata 💕 No sé si llamarlo RPG, depresión interactiva o filosofía con androides, pero me encanta jajaja', 8, 1),
(7, 'Re: RPG favorito', 'Final Fantasy VII, pero el original. Y esto lo digo con cariño antes de que alguien venga a pegarme por preferir polígonos con cuatro caras 😂', 3, 1),
(8, 'Re: RPG favorito', 'Yo no tengo tanta cultura de RPG como algunos de vosotros, pero estoy tomando apuntes 😅', 6, 1),
(9, 'Re: RPG favorito', 'Yo me quedo con los RPG en los que el sistema tiene suficiente profundidad como para experimentar. Cuando todo está demasiado guiado pierdo interés.', 4, 1),
(10, 'Mi setup', 'Portátil, monitor externo y espacio limpio. Soy bastante pesada con tener un escritorio cómodo porque si vas a estar horas trabajando, el entorno importa muchísimo.', 7, 2),
(11, 'Mi pequeño caos', 'Dos pantallas, cacharritos, consolas, una cantidad cuestionable de cosas kawaii y probablemente alguna Game Boy abierta por ahí (≧▽≦)ﾉ', 1, 2),
(12, 'Re: setup', 'Mi consejo después de demasiados años delante de ordenadores: preocupaos primero por la silla, la altura del monitor y trabajar cómodos. El teclado con lucecitas ya lo compráis después 😂', 9, 2),
(13, 'Mi setup', 'El mío ha ido creciendo por acumulación histórica. Dos monitores, altavoces bastante decentes y más cables de los que estoy dispuesto a reconocer. Lo importante es la música 😎', 4, 2),
(14, 'Re: setup', 'Yo soy bastante más austero. Un buen monitor, teclado cómodo y una silla decente. Después de cierta edad uno empieza a valorar más la espalda que el RGB.', 2, 2),
(15, 'Mi setup :)', 'El mío todavía es bastante normalito. Estoy aprendiendo que en informática siempre hay una cosa más que aparentemente \"necesitas\" comprar 😂', 6, 2),
(16, 'Re: setup', 'Yo tengo setup deportivo: cada vez que algo no funciona me levanto, doy una vuelta a la mesa y vuelvo a intentarlo. Método científico.', 5, 2),
(17, 'Re: setup', 'A mí me gusta que el espacio tenga un poco de personalidad. Si todo parece una oficina gris me deprimo 😂', 3, 2),
(18, 'Re: setup', 'Yo intento que todo sea bastante minimalista. Menos cosas sobre el escritorio = menos distracciones.', 8, 2),
(19, 'Infancia desbloqueada', 'Tekken, FIFA y cualquier cosa que permitiese picarse con otra persona. Yo no necesitaba narrativa, necesitaba GANAR 😂', 5, 3),
(20, 'Re: juegos de pequeños', 'Pokémon Crystal, Sailor Moon, Zelda... esas cosas se te meten en el cerebro y veinte años después estás haciendo una web con estética de internet japonesa de 2007. Todo perfectamente normal (￣▽￣)', 1, 3),
(21, 'Otra época', 'Los juegos de mi juventud eran bastante distintos de los que estáis mencionando algunos por aquí. Me fascina haber visto prácticamente toda la evolución del medio desde sus etapas más primitivas.', 2, 3),
(22, 'Re: infancia', 'Yo recuerdo sobre todo las recreativas y aquella época en la que descubrías juegos porque alguien los traía, no porque un algoritmo te los recomendase. Era otro mundo.', 3, 3),
(23, 'Re: juegos de pequeños', 'Lo curioso es que muchos juegos antiguos enseñaban al jugador con muy pocos recursos. Cuando no tienes tutoriales de veinte minutos, el diseño tiene que hablar por sí solo.', 9, 3),
(24, 'Re: infancia', 'Yo no era especialmente jugona, así que os estoy leyendo y descubriendo nombres 😅 Nunca es tarde, ¿no?', 6, 3),
(25, 'Re: infancia', 'Pokémon para mí también. Es increíble cómo algunos juegos se quedan asociados a una etapa concreta de tu vida 💕', 8, 3),
(26, 'Re: infancia', 'Yo tuve una etapa bastante de juegos de estrategia. Supongo que ya venía predispuesto a complicarme la vida con sistemas 😂', 4, 3),
(27, 'Mi workflow', 'COMFYUIIII ヽ(>∀<☆)ノ Me encanta porque puedes conectar veinte cosas, romperlo todo, no saber por qué funciona y acabar consiguiendo exactamente lo que querías. Muy relajante.', 1, 4),
(28, 'IA para imagen', 'Para trabajo visual me interesan mucho más las herramientas que permiten iterar que las que simplemente generan una imagen bonita. Poder controlar referencias, composición y consistencia cambia todo.', 7, 4),
(29, 'Una reflexión', 'Me parece una herramienta interesante, aunque conviene no confundir facilidad de generación con criterio artístico. La cámara fotográfica tampoco convirtió automáticamente a todo el mundo en fotógrafo.', 2, 4),
(30, 'Re: IA para imágenes', 'La herramienta me parece lo de menos si no sabéis explicar qué habéis hecho con ella. Si mañana me traéis un resultado perfecto y nadie sabe reproducir el proceso, os voy a hacer preguntas 😄', 9, 4),
(31, 'Re: IA para imagen', 'Me gusta Stable Diffusion por el control. Al principio parece un monstruo, pero una vez entiendes los nodos y el flujo ya cambia mucho la cosa 💗', 8, 4),
(32, 'Re: IA para imágenes', 'A mí lo que me interesa es cuando salen cosas medio rotas. Llevo suficientes años viendo arte y conciertos como para saber que a veces el accidente es más interesante que lo perfecto.', 3, 4),
(33, 'Re: IA', 'Yo todavía estoy aprendiendo todo esto, pero reconozco que poder pedir ejemplos visuales cuando no entiendes algo ayuda muchísimo.', 6, 4),
(34, 'Re: IA', 'Yo soy más de usarla como herramienta auxiliar. Si termina haciendo absolutamente todo por ti, no sé qué parte queda realmente tuya.', 4, 4),
(35, 'Re: IA para imágenes', 'Y antes de que alguien diga \"depende\"... 🎵 depende, ¿de qué depende? 🎵 Ya sabéis que no podéis dejar ciertas frases sueltas delante de mí.', 9, 4),
(36, 'Stable Diffusion', 'Stable Diffusion. No porque sea necesariamente más cómodo, sino porque prefiero una herramienta que me permita comprender y modificar el proceso.', 2, 5),
(37, 'Team SD', 'Stable Diffusion + ComfyUI ✧(≖ ◡ ≖✿) Midjourney es precioso pero yo necesito tocar absolutamente TODO y complicarme la vida innecesariamente.', 1, 5),
(38, 'Re: Stable Diffusion vs Midjourney', 'Desde el punto de vista de aprendizaje me parece más interesante una herramienta donde podáis ver y modificar el proceso. Que algo sea más cómodo no significa necesariamente que enseñe más.', 9, 5),
(39, 'Comparación', 'Midjourney tiene una entrada mucho más fácil. Stable Diffusion tiene una curva más dura, pero para alguien que quiere trabajar de forma técnica me parece bastante más interesante.', 7, 5),
(40, 'Re: SD vs MJ', 'Stable Diffusion también. Midjourney es rapidísimo para obtener algo bonito, pero cuando quieres consistencia y control empiezas a notar las limitaciones.', 8, 5),
(41, 'Mi análisis profesional', 'El mejor es el que Alfino no pueda convertir en otro ejercicio para entregar mañana.', 5, 5),
(42, 'Re: análisis profesional', 'Pablito, acabas de convertirlo automáticamente en candidato a ejercicio 😂', 9, 5),
(43, 'Re: SD vs MJ', 'Yo soy más de herramienta que me deje cacharrear. Si tiene veinte menús escondidos, probablemente acabaré entrando en todos.', 4, 5),
(44, 'Re: SD vs MJ', 'Midjourney me parece más inmediato, pero para hacer cosas personales creo que entiendo mejor que prefiráis SD.', 6, 5),
(45, 'Herramientas útiles', 'Yo estoy usando bastante ChatGPT para que me explique cosas de programación con otros ejemplos cuando no termino de entenderlas. Para aprender me está ayudando mucho 😊', 6, 6),
(46, 'Mis imprescindibles', 'ChatGPT para desarrollo y documentación, herramientas visuales para prototipar y automatizaciones para tareas repetitivas. La clave para mí es ahorrar tiempo, no pensar menos.', 7, 6),
(47, 'Re: herramientas', 'Los asistentes de código están bien mientras no sustituyan el razonamiento. Si aceptas todo lo que generan sin entenderlo, el día que falle vas vendido.', 4, 6),
(48, 'Re: herramientas de IA', 'Usad IA, buscadores, documentación o lo que necesitéis. Pero si os pregunto por una línea de vuestro código, quiero que sepáis decirme qué hace. Esa sigue siendo la norma 😄', 9, 6),
(49, 'Las que uso yo', 'ChatGPT + ComfyUI + modelos locales + cualquier cosa nueva que vea y me haga decir \"ooooh qué hace este botón??\" (☆▽☆)', 1, 6),
(50, 'Una observación', 'Creo que estamos viviendo algo parecido a otras grandes transiciones tecnológicas: primero se exagera lo que puede hacer una herramienta, después se normaliza y termina encontrando su lugar real.', 2, 6),
(51, 'Re: herramientas', 'Yo las uso muchísimo para acelerar procesos, pero cuanto más nivel tienes más fácil es detectar cuándo una respuesta está mal. Ese es el peligro para quien empieza.', 8, 6),
(52, 'Re: herramientas', 'Yo lo resumo fácil: si me ahorra una hora de mirar documentación para descubrir que escribí mal una variable, bienvenida sea 😂', 5, 6),
(53, 'Re: herramientas de IA', 'Y recordad: primero entender el problema, después buscar la herramienta. Si hacemos el orden contrario acabamos resolviendo muy eficientemente algo que nadie necesitaba.', 9, 6),
(54, 'Mi gran proyecto', 'Actualmente estoy desarrollando una aplicación extremadamente avanzada llamada \"intentar que PHP no explote\". Alfino dice que el nombre comercial podría mejorar.', 5, 7),
(55, 'Proyecto actual', 'Estoy intentando estructurar todo pensando primero en componentes y reutilización. Cuanto más grande se hace una interfaz, más importante es evitar repetir cosas.', 7, 7),
(56, 'Mi proyecto', 'Estoy trabajando en una interfaz donde estoy intentando cuidar mucho estructura, responsive y experiencia de usuario. Definitivamente sigo disfrutando más frontend que backend 💕', 8, 7),
(57, 'Re: proyectos', 'Pablito, \"funciona en mi ordenador\" no es todavía una metodología de control de calidad 😂', 9, 7),
(58, 'Lo último', 'Estoy haciendo algo bastante visual. Después de tantos años sigo cayendo en lo mismo: empiezo con una idea sencilla y acabo queriendo meter música, imágenes, efectos y veinte cosas más 😂', 3, 7),
(59, 'NEON//FORUM', 'Pues yo estoy haciendo un foro en PHP + MySQL con login, sesiones, temas, respuestas y perfiles!! No será Facebook pero EH, funciona (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧', 1, 7),
(60, 'Re: proyectos', 'Yo estoy aprovechando para recuperar conocimientos que tenía bastante olvidados. Hay cosas que vuelven muy rápido cuando empiezas a tocar código otra vez.', 4, 7),
(61, 'Re: NEON//FORUM', 'ChunChun, si ese foro ya tiene usuarios, sesiones, relaciones entre tablas y operaciones sobre mensajes, empieza a haber una aplicación de verdad. Ahora toca que el código quede tan ordenado como el resultado.', 9, 7),
(62, 'Re: proyectos', 'Yo todavía voy haciendo cosas pequeñas, pero ya me hace ilusión poder entender código que hace unas semanas me parecía chino 😊', 6, 7),
(63, 'Re: proyectos', 'Yo os insistiría en lo mismo para todos: nombres claros, separar responsabilidades y no escribir cinco veces algo que podéis resolver una sola vez. Lo aburrido suele ahorrar muchos problemas después.', 9, 7),
(64, 'Pregunta', 'Esto del pixel art parece fácil hasta que intentas hacerlo, ¿verdad? 😅 Yo veo cuatro cuadraditos y luego resulta que hay toda una ciencia detrás.', 6, 8),
(65, 'Pixel art', 'Primero silueta. Luego valores. Luego color. Si necesitas 200 colores para que funcione un sprite de 32 píxeles, probablemente el problema está en otro sitio (¬‿¬)', 1, 8),
(66, 'Re: pixel art', 'Me parece muy parecido al diseño de interfaces: cuando tienes restricciones claras, cada decisión pesa mucho más. Quitar suele ser más difícil que añadir.', 7, 8),
(67, 'Sobre las limitaciones', 'Precisamente las limitaciones técnicas fueron responsables de gran parte de la estética de los primeros videojuegos. Resulta interesante cómo ahora imitamos voluntariamente limitaciones que antes eran inevitables.', 2, 8),
(68, 'Re: pixel art', 'Esto tiene más relación con programación de la que parece. Cuando trabajáis con restricciones fuertes tenéis que decidir qué información es esencial y qué sobra. Es un ejercicio bastante bueno.', 9, 8),
(69, 'Re: pixel art', 'Es como programar: mueves un píxel durante media hora, decides que estaba mejor antes y has aprendido muchísimo sin cambiar absolutamente nada 😂', 8, 8),
(70, 'Re: pixel art', 'Confirmo. En arte también puedes estar veinte minutos mirando algo para acabar volviendo exactamente al punto inicial.', 3, 8),
(71, 'Re: pixel art', 'Yo después de ver esto respeto mucho más a quien hacía sprites con cuatro colores y 8 KB de memoria.', 5, 8),
(72, 'Actualmente', 'Estoy creando una relación emocional muy intensa con el botón de ejecutar. A veces funciona. A veces no. El amor es complicado.', 5, 9),
(73, 'Ahora mismo', 'NEON//FORUM!! PHP, SQL, sesiones, joins y probablemente algún bug escondido esperando a que lo encuentre (｡•̀ᴗ-)✧', 1, 9),
(74, 'Lo mío', 'Yo sigo avanzando poco a poco. Cuando consigo que algo que ayer no entendía hoy funcione me pongo contentísima 😊', 6, 9),
(75, 'Ahora mismo', 'Una interfaz bastante limpia. Estoy intentando resistir la tentación de añadir más cosas simplemente porque puedo.', 8, 9),
(76, 'Re: qué estáis creando', 'Me gusta ver que algunos ya estáis haciendo cosas fuera del ejercicio exacto que toca. Ahí es cuando empezáis a encontrar problemas que no vienen preparados de antemano.', 9, 9),
(77, 'Ahora mismo', 'Intentando recuperar un poco esa energía de hacer cosas porque sí. Durante años hacía proyectos creativos constantemente y me apetece volver a esa sensación.', 3, 9),
(78, 'Re: qué estás creando', 'Estoy experimentando con algunas ideas relacionadas con música y código. Llevo años programando y sigo encontrando divertido hacer que una máquina produzca algo que no estaba ahí antes.', 4, 9),
(79, 'Re: qué estáis creando', 'Pero terminad alguna cosa también, ¿eh? Que empezar proyectos nuevos es una actividad mucho más popular que cerrarlos 😂', 9, 9),
(80, 'Re: terminar cosas', 'Alfino no hacía falta atacarme personalmente delante de todo el foro.', 1, 9),
(81, 'YO TENGO COSAS', 'Game Boys. Muchas. Algunas enteras. Algunas en estados filosóficos intermedios entre \"consola\" y \"montón de piezas\" (づ｡◕‿‿◕｡)づ', 1, 10),
(82, 'Hardware raro', 'Yo pensaba que no tenía nada raro hasta que entré en este hilo. Ahora creo que simplemente soy la normal del grupo 😂', 5, 10),
(83, 'Una pieza curiosa', 'No sé si entra exactamente en \"hardware raro\", pero tengo algunos dispositivos antiguos que conservo más por historia de la tecnología que por utilidad. Me pasa lo mismo con determinados objetos de museo.', 2, 10),
(84, 'Re: hardware', 'Tengo cacharros viejos de audio que seguramente ocupan más espacio del que deberían. Pero si todavía funcionan no se tiran, eso es ley.', 4, 10),
(85, 'Re: hardware raro', 'Después de veinte años dando clase he visto sobrevivir ordenadores que técnicamente deberían llevar una década muertos. Hay máquinas que funcionan simplemente porque nadie se atreve a apagarlas.', 9, 10),
(86, 'Pregunta seria', 'ChunChun, ¿cuántas Game Boys hacen falta para que oficialmente tengas un problema? 😂', 6, 10),
(87, 'RESPUESTA SERIA', 'Floriii no sé de qué problema me hablas (◉‿◉)', 1, 10),
(88, 'Re: hardware', 'Yo tengo bastante menos arqueología tecnológica, aunque reconozco que las consolas transparentes antiguas me parecen preciosas 💕', 8, 10),
(89, 'Re: hardware raro', 'Caesar, esto un día hay que convertirlo en excursión tecnológica y terminar en un museo. Aunque luego seguramente acabemos hablando más del edificio que de los ordenadores 😄', 9, 10),
(90, 'MODS <3', 'IPS, carcasa bonita, botones nuevos y a vivir!! Si la consola está destrozada prefiero devolverla a la vida que dejarla muriéndose en un cajón (｡♥‿♥｡)', 1, 11),
(91, 'Conservar o modificar', 'Siempre he sido partidario de conservar los objetos históricos cuando tienen interés. Si existe un ejemplar original en buen estado, personalmente preferiría no alterarlo.', 2, 11),
(92, 'Mods', 'Vengo del deporte y jamás pensé que acabaría viendo debates sobre si cambiarle la pantalla a una Game Boy es sacrilegio. Me encanta este curso.', 5, 11),
(93, 'Re: mods', 'Hay mods realmente bien ejecutados. Cuando la modificación respeta el diseño original y mejora usabilidad, me parece incluso más interesante.', 7, 11),
(94, 'Re: conservar', 'Pero también hay algo muy punk en coger tecnología vieja y transformarla para que siga viva. Yo soy bastante partidaria del cacharreo si se hace con cariño.', 3, 11),
(95, 'Re: mods y retro', 'Yo aquí aplicaría una regla bastante sencilla: primero entender cómo funciona el original y después modificarlo. Es la misma filosofía que con el código.', 9, 11),
(96, 'Re: mods', 'Yo no tengo mano para desmontar consolas pero viendo las que hace ChunChun me están entrando ganas 😅', 6, 11),
(97, 'Re: mods', 'Modificar sí, pero documentando. Si después no sabes qué tocaste, mantenerlo se convierte en una pesadilla.', 4, 11),
(98, 'Re: mods y retro', 'Y documentad lo que desmontáis. \"Me sobraron tres tornillos pero funciona\" no cuenta como procedimiento técnico, Pablito 😂', 9, 11),
(99, 'Re: tornillos', 'Protesto. Si sobraron es porque claramente el fabricante puso de más.', 5, 11),
(100, 'WELCOME TO MY HOMEPAGE', 'Quiero cursores con estrellitas, gifs de UNDER CONSTRUCTION, guestbooks, botones de 88x31 y fondos imposibles!! internet devuélveme 2007 ヽ(´▽`)/', 1, 12),
(101, 'Re: vieja web', 'Las webs de aquella época eran horrorosas muchas veces, pero tenían personalidad. Igual que los flyers de ciertas raves: técnicamente criminales y absolutamente inolvidables 😂', 3, 12),
(102, 'La vieja web', 'Recuerdo cuando las páginas tenían una función bastante más documental. Eran menos sofisticadas, desde luego, pero también resultaban mucho más directas.', 2, 12),
(103, 'Internet antiguo', 'Yo llegué tarde a muchas de esas cosas, así que me hace gracia verlas ahora. Algunas parecen hechas en otro planeta 😅', 6, 12),
(104, 'Re: internet raro', 'El problema de la web actual es que demasiados productos han convergido en el mismo lenguaje visual. Desde UX es eficiente, pero también hemos perdido identidad.', 8, 12),
(105, 'Re: internet antiguo', 'Los que vivimos aquella web recordamos también la parte mala: tablas para maquetar, compatibilidad entre navegadores y auténticas barbaridades. La nostalgia selecciona bastante bien los recuerdos 😄', 9, 12),
(106, 'PETICIÓN FORMAL', 'Solicito que Alfino permita entregar el próximo ejercicio con Comic Sans, fondo de llamas y un gif de una calavera girando.', 5, 12),
(107, 'Re: petición formal', 'Pablito69, acepto Comic Sans, fondo de llamas y calavera giratoria con una condición: luego tienes que justificar cada decisión delante de toda la clase. A ver cuánto dura la propuesta 😂', 9, 12),
(108, 'Re: petición formal', 'Yo pagaría por ver esa defensa de diseño en directo 😂', 7, 12),
(109, 'Re: internet viejo', 'Yo echo de menos la sensación de entrar en una web y notar inmediatamente que la había hecho una persona concreta.', 4, 12),
(110, 'Re: internet antiguo', 'Por cierto, hablando de fiestas y de cosas que vuelven cada año... ya deberíais saber todos cuál es la próxima fiesta patronal de la zona. Información esencial del curso.', 9, 12),
(111, 'Re: fiestas', 'Y aquí tenemos el verdadero motivo por el que Alfino abrió el hilo.', 3, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `id_tema` int(11) NOT NULL,
  `titulo_tema` varchar(150) NOT NULL,
  `seccion` varchar(100) NOT NULL,
  `num_msj` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`id_tema`, `titulo_tema`, `seccion`, `num_msj`) VALUES
(1, '¿Cuál es vuestro RPG favorito?', 'Gaming', 0),
(2, 'Enseña tu setup', 'Gaming', 0),
(3, 'Juegos que os marcaron de pequeños', 'Gaming', 0),
(4, '¿Qué IA usáis para crear imágenes?', 'IA', 0),
(5, 'Stable Diffusion vs Midjourney', 'IA', 0),
(6, 'Herramientas de IA que merecen la pena', 'IA', 0),
(7, 'Comparte tu último proyecto', 'Arte digital', 0),
(8, 'Pixel art: trucos y recursos', 'Arte digital', 0),
(9, '¿Qué estás creando ahora mismo?', 'Arte digital', 0),
(10, 'Hardware raro que tenéis en casa', 'Tecnología', 0),
(11, 'Mods y consolas retro', 'Tecnología', 0),
(12, 'Internet raro: webs que parecen de otra época', 'Cultura de internet', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usu` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `firma` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usu`, `nickname`, `email`, `password`, `avatar`, `firma`) VALUES
(1, 'ChunChun', 'xulia@mail.com', '$2y$10$bZrddLzYLxKwMd8LaW9a8.x98YZjn7LMNNSx8yryo3X4GEEIJF/7q', 'avatar_1_1788807336.png', '(*^▽^*)/ Retro, IA, arte digital y cacharreo // arreglando Game Boys y montando interfaces raritas.'),
(2, 'Caesar', 'cesar@mail.com', '$2y$10$ZMxOwcMb1Uh..6ThlPIBUOQM50oa1kAHWujDkqMvkwuTOQaovr2RK', 'avatar_2_1788807629.jpg', 'La tecnología también es cultura. Ex-programador, amante de los museos y de observar el mundo con calma.'),
(3, 'Marci', 'marcia@mail.com', '$2y$10$F05ln3gew3ZUzDDlHENwSO/HDwzc3jc2npEnoQDqHOTD33JlcTUw6', 'avatar_3_1788807859.webp', 'Metal, raves y código. Si hace calor probablemente estaré de peor humor.'),
(4, 'Luiiiis', 'luis@mail.com', '$2y$10$HWiAK6Wy2s9G0uBQgnpMlO8e.G/v2kG0clXI5hbX1IudrOh6LnDZS', 'avatar_4_1788807943.webp', 'Código, música y café. Padre de David. A veces moderno, a veces señor de otra época.'),
(5, 'pablito69', 'pablo@mail.com', '$2y$10$aU6HYFkrACk2HuTyPkWp7uahiO0NmGg7MDW7QQe2d5hdCCrN7vjk2', 'avatar_5_1788807705.jpg', 'Si funciona, perfecto. Si no funciona, primero se vacila y luego se depura xD'),
(6, 'Floriii', 'flora@mail.com', '$2y$10$5elBtYZ1ziuRYOwMtbzOtOKyDY1.lR5qIL.j3RP8Lk4vSdjTcKOrW', 'avatar_6_1788808073.jpg', 'Aprendiendo poco a poco :) Ex farmacéutica, nueva en programación pero con muchas ganas.'),
(7, 'Steph', 'steph@mail.com', '$2y$10$Xj0qt0jhESm2TQbPUwK4n.xhvhQb5/0c6a16e4LlOGix9RioIB1ya', 'avatar_7_1788808180.png', 'Frontend first. Marketing, desarrollo y criterio visual para construir cosas con sentido.'),
(8, 'isaBELLA', 'isa@mail.com', '$2y$10$W8ZRIVotXhKSSu8YtkEJFub24YaUkKxfsYC0J2uh5md4iN66xVzti', 'avatar_8_1788808304.webp', 'Con calma y cariño todo sale <3 Ingeniería, frontend y buenas vibras.'),
(9, 'Alfino', 'Alfonso@mail.com', '$2y$10$FJDHHMsI4LFEb9R3A4Wo4OBxlo7Jqw/rlLGraRAxh4glJnRuKzBWa', 'avatar_9_1788807680.jpg', 'Programar con método, enseñar con paciencia y cantar en clase cuando alguien dice una frase peligrosa.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id_mensaje`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usu`),
  ADD UNIQUE KEY `nickname` (`nickname`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id_mensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`id_tema`) REFERENCES `temas` (`id_tema`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
