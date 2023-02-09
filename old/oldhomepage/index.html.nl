<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="nl">
<head>
	<title>Slint: Het Slackware Internationaliseringsproject </title>
    <meta name="google-site-verification" content="LmAtE9by4Mg59SwZ0LyQq730fGtMZ0r0fqgkVurfPhc" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="Slackware internationalization Project" />
    <link rel="stylesheet" href="css/fp.css" type="text/css" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
</head>
<body>
  <div class="entete"> 
	Kies je taal => | <a href="index.html.bs">bs</a> | <a
href="index.html.de">de</a> | <a href="index.html.el">el</a> | <a
href="index.html.en">en</a> | <a href="index.html.es">es</a> | <a
href="index.html.fr">fr</a> | <a href="index.html.id">id</a> | <a
href="index.html.it">it</a> | <a href="index.html.nl">nl</a> | <a
href="index.html.pl_PL">pl</a> | <a href="index.html.pt">pt</a> | <a
href="index.html.ru">ru</a> | <a href="index.html.tr_TR">tr</a> | <a
href="index.html.uk">uk</a> | 
  </div>
	<div id="hautdepage"></div>
	<h1>Het Slackware Internationaliseringsproject</h1>
	<div class="cadre w100">
		<h2 class="premierh2 center">Over slint</h2>
		<p>Het ultieme doel van dit project is dat alle gebruikers Slackware Linux in
hun moedertaal kunnen installeren en gebruiken.</p>
		<p>Dat kan het aantal Slackware gebruikers doen toenemen, net als het Slackware
Documentation Project, dat nu al documentatie bevat in vele talen.</p>
		<p>Het is nog niet in Slackware opgenomen en alleen de Slackware ontwikkelaar
kan besluiten dit te doen.</p>
		<p>Niettemin is het slint project, dat noch aangesloten is bij noch ondersteund
wordt door Slackware, een stap in die richting.</p>
	</div>
	<div class="cadre w50">
		<h2 class="premierh2">Gebruik slint</h2>
		<p>Het project voorziet:</p>
		<ul>
			<li>Een softwarepakket dat het ten eerste mogelijk maakt een
geïnternationaliseerde installer aan een Slackware DVD toe te voegen en ten
tweede het in meer talen te vertalen.</li>
			<li>Geïnternationaliseerde installers voor elke ondersteunde Slackware editie in
twee vormen: Een ISO image om op CD of DVD te branden en een image om op een
USB stick te zetten.</li>
		</ul>
		<p>Op het moment bevat de geïnternationaliseerde installer:</p>
		<ul>
			<li>Varianten voor Slackware-13.37, Slackware-14.0 en Slackware-14.1 (32 en 64
bit),</li>
			<li>Lokalisatie in het Frans, Duits, Pools, Braziliaans Portugees, Russisch,
Spaans (Latijns Amerika) en de Oekraïens.</li>
		</ul>
        <h3><span>Gebruik van USB ISO images van geïnternationaliseerde
installers</span></h3>
        <p>Ga naar de subdirectory van <a
href="https://slint.fr/pub">https://slint.fr/pub</a> corresponderend met de
editie waarvoor je de installer wilt hebben, bijvoorbeeld <a
href="https://slint.fr/pub/64-14.1">https://slint.fr/pub/64-14.1</a> voor
Slackware64-14.1 en volg de instructies.
        </p>
        <p>Het branden van een CD of DVD met geïnternationaliseerde installer voor
Slackware64-14.1:</p>
        <ul>
            <li>growisofs -speed=2 -dvd-compat -Z /dev/dvd=[bestandsnaam eindigend met .iso]</li>
        </ul>
        <p>Het op een USB stick genaamd /dev/sdc (voorbeeld, te vervangen door de naam
gevonden door 'cat /proc/partitions' of 'dmesg | tail') zetten van een
geïnternationaliseerde Slackware64-14.1 installer: </p>
        <ul>
           <li>dd if=[bestandsnaam eindigend met .img] of=/dev/sdc bs=512</li>
        </ul>
        <p>WAARSCHUWING:</p>
        <ul>
          <li>Verzeker je ervan dat /dev/sdc (of anders) niet de naam is van een harde
schijf omdat deze dan ONHERSTELBAAR GEWIST WORDT! </li>
          <li>Huidige inhoud van de USB stick wordt gewist dus sla deze ergens anders op
voordat je begint als je die wilt bewaren.</li>
        </ul>
        <p>NOOT: Om een installatie te kunnen uitvoeren heb je behalve de installer ook
media van de softwarepakketten van dezelfde editie nodig, bijvoorbeeld een
Slackware DVD of een lokale mirror. Deze pakketten zitten niet in de ISO en
USB images. 
        </p>
		<h3><span>Gebruik van softwarepakket <a
href="https://slint.fr/pub/slint-20140206.tar.xz">slint-[datum].tar.xz</a></span></h3>
		<p>Je hebt nodig, buiten het softwarepakket zelf:</p>
		<ol>
			<li>Een complete mirror van de Slackware editie die je wilt internationaliseren:
een Slackware DVD, een ISO image of een lokale mirror.
			</li>
			<li>Een Linux distributie met 'gettext' tools en bestanden benodigd voor
internationalisering. Natuurlijk heeft een volledige Slackware de voorkeur
maar je kunt ook slint downloaden en een andere Linux systeem gebruiken,
			</li>
		</ol>
		<p>Download <a href="https://slint.fr/pub/slint-20140206.tar.xz">het
softwarepakket</a>, en <a
href="https://slint.fr/pub/slint-20140206.tar.xz.md5">het md5
controlebestand</a> en typ het volgende commando:</p>
		<ul>
			<li>md5sum -c slint-[datum].tar.xz.md5 # resultaat moet "OK" zijn</li>
		</ul>
		<p>Pak hierna het pakket uit:</p>
		<ul>
		   <li>tar xf slint-[datum].tar.xz # subdirectory slint-[datum] wordt aangemaakt</li>
		</ul>
		<p>Typ tenslotte als root:</p>
		<ul>
			<li>slint-[datum]/slint.sh</li>
		</ul>
		<p>Volg de instructies van het script. Je zult op de commandoregel moeten
aangeven welke Slackware editie je wilt internationaliseren. Het script zal
je vragen om:</p>
		<ul>
			<li>Het pad naar de lokale mirror van de Slackware editie die je wilt
internationaliseren,
			</li>
			<li>Welke talen je wilt opnemen in de geïnternationaliseerde installer (als je
je afvraagt waarom US English niet in de lijst staat: deze is er altijd in
opgenomen ;-)
			</li>
		</ul>
    </div>
	<div class="w50 cadresuivant">
		<h2 class="premierh2">Draag bij aan slint</h2>
		<h3><span>Hulp gezocht</span></h3>
		<p>We hebben nog steeds vertalers nodig om bestaande teams te versterken en om
in meer talen te vertalen.</p>
		<p>Om je aan te sluiten bij een bestaand vertaalteam of om een nieuw team te
starten ga naar <a
href="https://www.transifex.com/projects/p/slint/">Transifex</a>, zie het
bestand <a href="https://slint.fr/pub/TRANSLATORS">TRANSLATORS</a> voor
details.</p>
		<p>Maar kijk eerst eens naar de <a href="https://slint.fr/slint">slint
bestanden</a> om een indruk te krijgen van de hoeveelheid werk.</p>
		<h3><span>Op Transifex geregistreerde vertalers en recensenten</span></h3>
		<table border="1">
			<tr><th>Vertaler</th><th>Taal</th><th>Locale</th></tr>
			<tr><td>dlee99</td><td>Nederlands</td><td>nl_NL</td></tr>
			<tr><td>Eric Hameleers</td><td>Nederlands</td><td>nl_NL</td></tr>
			<tr><td>ponce</td><td>Italiaans</td><td>it_IT</td></tr>
			<tr><td>celyr</td><td>Italiaans</td><td>it_IT</td></tr>
			<tr><td>Sébastien Boillod</td><td>Frans</td><td>fr_FR</td></tr>
			<tr><td>Didier Spaier</td><td>Frans</td><td>fr_FR</td></tr>
			<tr><td>Marcin Herda</td><td>Pools</td><td>pl_PL</td></tr>
			<tr><td>Piotr Maksymiec</td><td>Pools</td><td>pl_PL</td></tr>
			<tr><td>elesmod</td><td>Pools</td><td>pl_PL</td></tr>
			<tr><td>Christian Ruesch</td><td>Duits</td><td>de_DE</td></tr>
			<tr><td>franzen</td><td>Duits</td><td>de_DE</td></tr>
			<tr><td>Johannes Georgi</td><td>Duits</td><td>de_DE</td></tr>
			<tr><td>Maik Wagner</td><td>Duits</td><td>de_DE</td></tr>
			<tr><td>Marcel Saegebarth</td><td>Duits</td><td>de_DE</td></tr>
			<tr><td>spongetron</td><td>Duits</td><td>de_DE</td></tr>
			<tr><td>titopoquito</td><td>Duits</td><td>de_DE</td></tr>
			<tr><td>Adriano Balani</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>Enrico Nicoletto</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>Fela</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>Gabriel Magno</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>lcavalheiro</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>Retalhador</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>br_Orion</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>igaldino</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>Malkon Rodrigo</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>marcelo.castro</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>Xerxes Lins</td><td>Braziliaans Portugees</td><td>pt_BR</td></tr>
			<tr><td>Dimitris Tzemos</td><td>Grieks</td><td>el_GR</td></tr>
			<tr><td>dreamwalking</td><td>Grieks</td><td>el_GR</td></tr>
			<tr><td>George Vlahavas</td><td>Grieks</td><td>el_GR</td></tr>
			<tr><td>Diantre</td><td>Spaans (Latijns Amerikaans)</td><td>es_419</td></tr>
			<tr><td>AlvaroG</td><td>Spaans (Latijns Amerikaans)</td><td>es_419</td></tr>
			<tr><td>ecoslacker</td><td>Spaans (Latijns Amerikaans)</td><td>es_419</td></tr>
			<tr><td>sombragris</td><td>Spaans (Latijns Amerikaans)</td><td>es_419</td></tr>
			<tr><td>Serg Bormant</td><td>Russisch</td><td>ru_RU</td></tr>
			<tr><td>Sergey Ignatev</td><td>Russisch</td><td>ru_RU</td></tr>
			<tr><td>Yaroslav Shmelev</td><td>Russisch</td><td>ru_RU</td></tr>
			<tr><td>Graf</td><td>Russisch</td><td>ru_RU</td></tr>
			<tr><td>adioe3</td><td>Bosnisch (Bosnie en Herzegovina)</td><td>bs_BA</td></tr>
			<tr><td>willysr</td><td>Indonesisch</td><td>id_ID</td></tr>
			<tr><td>kisil</td><td>Oekraïens</td><td>uk_UA</td></tr>
			<tr><td>uatech</td><td>Oekraïens</td><td>uk_UA</td></tr>
			<tr><td>xuser13</td><td>Oekraïens</td><td>uk_UA</td></tr>
			<tr><td>Koljan1970</td><td>Oekraïens</td><td>uk_UA</td></tr>
			<tr><td>Kemal Ökmen</td><td>Turks</td><td>tr_TR</td></tr>
		</table>
		<p>Wanneer er een nieuwe taal beschikbaar is zal deze worden opgenomen in de
installer en een nieuwe versie zal verstrekt worden in <a
href="https://slint.fr/pub">deze directory.</a></p>
		<h3><span>Let's team up</span></h3>
		<p>Iedere bijdrage of betrokkenheid is welkom.</p>
		<p>De geïnternationaliseerde installer kan tevens bruikbaar zijn voor op
Slackware gebaseerde distributies.</p>
		<p> Gebruikers van en bijdragers aan deze distributies zijn van harte welkom om
slint te gebruiken en hieraan bij te dragen.</p>
	</div>
</body>
</html>
