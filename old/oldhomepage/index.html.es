<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="es">
<head>
	<title>Slint: El Proyecto de Internacionalización de Slackware </title>
    <meta name="google-site-verification" content="LmAtE9by4Mg59SwZ0LyQq730fGtMZ0r0fqgkVurfPhc" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="Slackware internationalization Project" />
    <link rel="stylesheet" href="css/fp.css" type="text/css" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
</head>
<body>
  <div class="entete"> 
	Escoja su lenguaje => | <a href="index.html.bs">bs</a> | <a
href="index.html.de">de</a> | <a href="index.html.el">el</a> | <a
href="index.html.en">en</a> | <a href="index.html.es">es</a> | <a
href="index.html.fr">fr</a> | <a href="index.html.id">id</a> | <a
href="index.html.it">it</a> | <a href="index.html.nl">nl</a> | <a
href="index.html.pl_PL">pl</a> | <a href="index.html.pt">pt</a> | <a
href="index.html.ru">ru</a> | <a href="index.html.tr_TR">tr</a> | <a
href="index.html.uk">uk</a> | 
  </div>
	<div id="hautdepage"></div>
	<h1>El Proyecto de Internacionalización de Slackware</h1>
	<div class="cadre w100">
		<h2 class="premierh2 center">Acerca de slint</h2>
		<p>La meta definitiva del proyecto es que todos los usuarios puedan instalar y
usar Slackware Linux en su lenguaje nativo.</p>
		<p>Esto podría expandir la comunidad de usuarios de Slackware, como lo hace el
Projecto de Documentación de Slackware, el cual provee documentación en
muchos lenguajes.</p>
		<p>El proyecto no está todavía dentro del ámbito de Slackware, y solamente el
encargado de Slackware puede decidir ampliar este ámbito.</p>
		<p>Sin embargo el proyecto slint, el cual no está afiliado ni es respaldado por
Slackware, es un paso en esa dirección.</p>
	</div>
	<div class="cadre w50">
		<h2 class="premierh2">Usando slint</h2>
		<p>El proyecto provee:</p>
		<ul>
			<li>Un paquete de software que, en primer lugar, permite incluir un instalador
internacionalizado en el DVD de Slackware, y en segundo lugar, permite
traducirlo a más lenguajes.</li>
			<li>instaladores internacionalizados para cada edición soportada de Slackware en
dos formatos: una imagen ISO para ser quemada en un CD o DVD y una imagen
para ser escrita en un dispositivo USB.</li>
		</ul>
		<p>Actualmente el instalador internacionalizado incluye:</p>
		<ul>
			<li>variantes para Slackware-13.37, Slackware-14.0 y Slackware-14.1 (32 y 64
bits),</li>
			<li>localización en Francés, Alemán, Polaco, Portugués (Brasil), Ruso, Español
(América Latina) y Ucraniano.</li>
		</ul>
        <h3><span>Utilizando imágenes ISO para USB de los instaladores
internacionalizados</span></h3>
        <p>Ingrese al subdirectorio <a
href="https://slint.fr/pub">https://slint.fr/pub</a> correspondiente a la
edición para la cual desea un instalador, por ejemplo <a
href="https://slint.fr/pub/64-14.1">https://slint.fr/pub/64-14.1</a> para
Slackware64-14.1 y siga las instrucciones.
        </p>
        <p>Para quemar un CD o DVD del instalador internacionalizado para
Slackware64-14.1:</p>
        <ul>
            <li>growisofs -speed=2 -dvd-compat -Z /dev/dvd=[archivo terminado en .iso]</li>
        </ul>
        <p>Para grabar el instalador internacionalizado de Slackware64-14.1 en un
dispositivo USB llamado /dev/sdc (es un ejemplo, cámbielo por el nombre
mostrado por el comando 'cat /proc/partitions' o 'dmesg|tail'):</p>
        <ul>
           <li>dd if=[archivo terminado en .img] of=/dev/sdc bs=512</li>
        </ul>
        <p>ADVERTENCIA:</p>
        <ul>
          <li>asegúrese que /dev/sdc (u otro) no sea el nombre de un disco duro, ya que
sus contenidos ¡SERÍAN BORRADOS SIN POSIBILIDAD DE RECUPERACIÓN! </li>
          <li>El contenido previo del dispositivo USB será borrado, así que sálvelo en
otro lugar antes de comenzar si quiere preservarlo.</li>
        </ul>
        <p>NOTA. Para realizar la instalación necesitará, además del instalador, el
medio de los paquetes de software para la misma versión, por ejemplo un DVD
de Slackware o un espejo local, ya que estos paquetes no están incluidos en
las imágenes ISO o USB. 
        </p>
		<h3><span>Uso del paquete de software <a
href="https://slint.fr/pub/slint-20140206.tar.xz">slint-[fecha].tar.xz</a></span></h3>
		<p>Además del paquete de software, necesitará:</p>
		<ol>
			<li>Un espejo completo de la edición de Slackware que desea internacionalizar:
un DVD de Slackware, una imagen ISO o un espejo local.
			</li>
			<li>una distribución de Linux que incluya las herramientas 'gettext' y los
archivos necesarios para la internacionalización. Por supuesto, una
instalación completa de Slackware es preferida, pero es posible descargar
slint y utilizarlo en otro sistema Linux,
			</li>
		</ol>
		<p>Descargue <a href="https://slint.fr/pub/slint-20140206.tar.xz">el paquete de
software</a>, y <a href="https://slint.fr/pub/slint-20140206.tar.xz.md5">el
archivo de verificación md5</a> también, luego escriba el siguiente comando:</p>
		<ul>
			<li>md5sum -c slint-[fecha].tar.xz.md5 # el resultado debe ser "OK"</li>
		</ul>
		<p>Luego descomprima el paquete:</p>
		<ul>
		   <li>tar xf slint-[fecha].tar.xz # esto creará el subdirectorio slint-[fecha]</li>
		</ul>
		<p>Finalmente escriba, como root:</p>
		<ul>
			<li>slint-[fecha]/slint.sh</li>
		</ul>
		<p>Siga las instrucciones del script. Indique en la línea de comandos cuál
edición de Slackware desea internacionalizar. El script le preguntará
entonces:</p>
		<ul>
			<li>la ruta al espejo local de la edición de Slackware que desea
internacionalizar,
			</li>
			<li>cuáles lenguajes desea incluir en el instalador internacionalizado (en caso
de que se pregunte por qué el inglés de EEUU no está listado, es porque
siempre se incluye :-)
			</li>
		</ul>
    </div>
	<div class="w50 cadresuivant">
		<h2 class="premierh2">Contribuir con slint</h2>
		<h3><span>Se necesita ayuda</span></h3>
		<p>Todavía necesitamos traductores para fortalecer los equipos existentes y
para la traducción en otros lenguajes.</p>
		<p>Puede hacer una solicitud para unirse o crear un equipo de traducción en el
sitio del proyecto en <a
href="https://www.transifex.com/projects/p/slint/">Transifex</a>, vea el
archivo <a href="https://slint.fr/pub/TRANSLATORS">TRANSLATORS</a> para los
detalles.</p>
		<p>Pero primero revise los <a href="https://slint.fr/slint">archivos de
slint</a> para que se haga una idea de la clase y cantidad de trabajo
necesario.</p>
		<h3><span>Traductores y correctores registrados en Transifex</span></h3>
		<table border="1">
			<tr><th>Traductor</th><th>Lenguaje</th><th>Localización</th></tr>
			<tr><td>dlee99</td><td>Holandés</td><td>nl_NL</td></tr>
			<tr><td>Eric Hameleers</td><td>Holandés</td><td>nl_NL</td></tr>
			<tr><td>ponce</td><td>Italiano</td><td>it_IT</td></tr>
			<tr><td>celyr</td><td>Italiano</td><td>it_IT</td></tr>
			<tr><td>Sébastien Boillod</td><td>Francés</td><td>fr_FR</td></tr>
			<tr><td>Didier Spaier</td><td>Francés</td><td>fr_FR</td></tr>
			<tr><td>Marcin Herda</td><td>Polaco</td><td>pl_PL</td></tr>
			<tr><td>Piotr Maksymiec</td><td>Polaco</td><td>pl_PL</td></tr>
			<tr><td>elesmod</td><td>Polaco</td><td>pl_PL</td></tr>
			<tr><td>Christian Ruesch</td><td>Alemán</td><td>de_DE</td></tr>
			<tr><td>franzen</td><td>Alemán</td><td>de_DE</td></tr>
			<tr><td>Johannes Georgi</td><td>Alemán</td><td>de_DE</td></tr>
			<tr><td>Maik Wagner</td><td>Alemán</td><td>de_DE</td></tr>
			<tr><td>Marcel Saegebarth</td><td>Alemán</td><td>de_DE</td></tr>
			<tr><td>spongetron</td><td>Alemán</td><td>de_DE</td></tr>
			<tr><td>titopoquito</td><td>Alemán</td><td>de_DE</td></tr>
			<tr><td>Adriano Balani</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>Enrico Nicoletto</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>dlee99</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>Gabriel Magno</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>Icavalheiro</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>Retalhador</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>br_Orion</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>igaldino</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>Malkon Rodrigo</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>marcelo.castro</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>Xerxes Lins</td><td>Portugués Brasileño</td><td>pt_BR</td></tr>
			<tr><td>Dimitris Tzemos</td><td>Griego</td><td>el_GR</td></tr>
			<tr><td>dreamwalking</td><td>Griego</td><td>el_GR</td></tr>
			<tr><td>George Vlahavas</td><td>Griego</td><td>el_GR</td></tr>
			<tr><td>Diantre</td><td>Español (América Latina)</td><td>es_419</td></tr>
			<tr><td>AlvaroG</td><td>Español (América Latina)</td><td>es_419</td></tr>
			<tr><td>ecoslacker</td><td>Español (América Latina)</td><td>es_419</td></tr>
			<tr><td>sombragris</td><td>Español (América Latina)</td><td>es_419</td></tr>
			<tr><td>Serg Bormant</td><td>Ruso</td><td>ru_RU</td></tr>
			<tr><td>Sergey Ignatev</td><td>Ruso</td><td>ru_RU</td></tr>
			<tr><td>Yaroslav Shmelev</td><td>Ruso</td><td>ru_RU</td></tr>
			<tr><td>Graf</td><td>Ruso</td><td>ru_RU</td></tr>
			<tr><td>adioe3</td><td>Bosnio (Bosnia y Herzegovina)</td><td>bs_BA</td></tr>
			<tr><td>willysr</td><td>Indonesio</td><td>id_ID</td></tr>
			<tr><td>kisil</td><td>Ucraniano</td><td>uk_UA</td></tr>
			<tr><td>uatech</td><td>Ucraniano</td><td>uk_UA</td></tr>
			<tr><td>xuser13</td><td>Ucraniano</td><td>uk_UA</td></tr>
			<tr><td>Koljan1970</td><td>Ucraniano</td><td>uk_UA</td></tr>
			<tr><td>Kemal Ökmen</td><td>Turco</td><td>tr_TR</td></tr>
		</table>
		<p>Siempre que un nuevo lenguajes esté disponible, será agregado al instalador
y una nueva versión estará disponible en <a href="https://slint.fr/pub">este
directorio.</a></p>
		<h3><span>Hagamos un equipo</span></h3>
		<p>Cualquier clase de contribución o participación es bienvenida.</p>
		<p>El instalador internacionalizado también podría ser útil para distribuciones
basadas en Slackware.</p>
		<p> Los usuarios y colaboradores de estas distribuciones son bienvenidos a usar
y contribuir al proyecto slint.</p>
	</div>
</body>
</html>
