<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="ru">
<head>
	<title>Slint: Проект интернационализации Slackware </title>
    <meta name="google-site-verification" content="LmAtE9by4Mg59SwZ0LyQq730fGtMZ0r0fqgkVurfPhc" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="Slackware internationalization Project" />
    <link rel="stylesheet" href="css/fp.css" type="text/css" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
</head>
<body>
  <div class="entete"> 
	Выберите язык => | <a href="index.html.bs">bs</a> | <a
href="index.html.de">de</a> | <a href="index.html.el">el</a> | <a
href="index.html.en">en</a> | <a href="index.html.es">es</a> | <a
href="index.html.fr">fr</a> | <a href="index.html.id">id</a> | <a
href="index.html.it">it</a> | <a href="index.html.nl">nl</a> | <a
href="index.html.pl_PL">pl</a> | <a href="index.html.pt">pt</a> | <a
href="index.html.ru">ru</a> | <a href="index.html.tr_TR">tr</a> | <a
href="index.html.uk">uk</a> | 
  </div>
	<div id="hautdepage"></div>
	<h1>Проект интернационализации Slackware</h1>
	<div class="cadre w100">
		<h2 class="premierh2 center">Про slint</h2>
		<p>Главная цель проекта - предоставить пользователем возможность применения
своего родного языка при установке Slackware.</p>
		<p>Это будет способствовать расширению пользовательской базы Slackware, как и
<a href="http://docs.slackware.com/">Проект документации Slackware</a>,
содержащий тексты на многих языках.</p>
		<p>Проект пока не включён в Slackware, и только руководитель Slackware может
принять подобное решение.</p>
		<p>И тем не менее, хотя проект slint и не является аффилированным и одобренным
Slackware, он является шагом в этом направлении.</p>
	</div>
	<div class="cadre w50">
		<h2 class="premierh2">Использование slint</h2>
		<p>Проект предоставляет:</p>
		<ul>
			<li>программный пакет, позволяющий 1) внедрять в DVD Slackware переведённый
установщик и 2) переводить его на другие языки.</li>
			<li>переведённые установщики для каждой поддерживаемой редакции Slackware в двух
вариантах: образ ISO для записи на CD или DVD и образ для записи на носитель
USB.</li>
		</ul>
		<p>На момент написания установщик включает:</p>
		<ul>
			<li>варианты для Slackware-13.37, Slackware-14.0 и Slackware-14.1 (32 и 64 бит),</li>
			<li>русский, французский, немецкий, польский, португальский (бразильский),
испанский (латиноамериканский) и украинские переводы.</li>
		</ul>
        <h3><span>Использование образов установщика</span></h3>
        <p>Перейдите в подкаталог <a
href="https://slint.fr/pub">https://slint.fr/pub</a>, соответствующий
желаемому выпуску, например, <a
href="https://slint.fr/pub/64-14.1">https://slint.fr/pub/64-14.1</a> для
Slackware64-14.1, и следуйте инструкциям.
        </p>
        <p>Для записи переведённого установщика Slackware64-14.1 на CD или DVD:</p>
        <ul>
            <li>growisofs -speed=2 -dvd-compat -Z /dev/dvd=[файл .iso]</li>
        </ul>
        <p>Для записи переведённого установщика для Slackware64-14.1 на носитель USB с
именем /dev/sdc (замените его найденным с помощью команд 'cat
/proc/partitions' или 'dmesg|tail'):</p>
        <ul>
           <li>dd if=[файл .img] of=/dev/sdc bs=512</li>
        </ul>
        <p>ВНИМАНИЕ:</p>
        <ul>
          <li>Содержимое /dev/sdc (того, что указано после of=) БУДЕТ УДАЛЕНО
БЕЗВОЗВРАТНО, перепроверьте, что это не жёсткий диск!  </li>
          <li>Предыдущее содержимое носителя USB будет удалено, поэтому, если его нужно
сохранить, сделайте предварительно копию.</li>
        </ul>
        <p>ЗАМЕЧАНИЕ. Поскольку пакеты не включаются в образы ISO или USB, для
выполнения установки в дополнение к установщику потребуется носитель с
пакетами той же версии, например, DVD Slackware или локальное зеркало. 
        </p>
		<h3><span>Использование пакета <a
href="https://slint.fr/pub/slint-20140206.tar.xz">slint-[дата].tar.xz</a></span></h3>
		<p>Помимо собственно пакета потребуется:</p>
		<ol>
			<li>Полное зеркало версии Slackware для обработки: Slackware DVD, образ ISO или
локальное зеркало.
			</li>
			<li>Установленная система Linux с инструментами 'gettext' и файлами для
перевода. Предпочтительна полная установка Slackware, но можно использовать
slint и в другой системе Linux.
			</li>
		</ol>
		<p>Загрузите <a href="https://slint.fr/pub/slint-20140206.tar.xz">пакет
slint</a>, а также <a
href="https://slint.fr/pub/slint-20140206.tar.xz.md5">контрольный файл
md5</a>, затем выполните команду:</p>
		<ul>
			<li>md5sum -c slint-[дата].tar.xz.md5 # вывод должен быть "OK" или "УСПЕХ"</li>
		</ul>
		<p>Распакуйте пакет:</p>
		<ul>
		   <li>tar xf slint-[дата].tar.xz # будет создан каталог slint-[дата]</li>
		</ul>
		<p>Наконец, выполните от root:</p>
		<ul>
			<li>slint-[дата]/slint.sh</li>
		</ul>
		<p>Следуйте инструкциям сценария. Укажите версию Slackware для перевода. Затем
сценарий попросит указать</p>
		<ul>
			<li>путь к локальному зеркалу нужной версии Slackware,
			</li>
			<li>список языков для включения в установщик (не удивляйтесь отсутствию в списке
английского, он всегда на месте :-) )
			</li>
		</ul>
    </div>
	<div class="w50 cadresuivant">
		<h2 class="premierh2">Содействие slint</h2>
		<h3><span>Нужна помощь</span></h3>
		<p>Нам по-прежнему нужны переводчики для усилинея команд и перевода на другие
языки.</p>
		<p>Запросите создание или присоединение к группе переводчиков проекта на <a
href="https://www.transifex.com/projects/p/slint/">Transifex</a>, подробнее
в файле <a href="https://slint.fr/pub/TRANSLATORS">TRANSLATORS</a>.</p>
		<p>Но сперва посмотрите на <a href="https://slint.fr/slint">файлы slint</a>,
чтобы получить представление о типе и объёме предстоящей работы.</p>
		<h3><span>Переводчики и корректоры, зарегистрированные на Transifex</span></h3>
		<table border="1">
			<tr><th>Переводчик</th><th>Язык</th><th>Локаль</th></tr>
			<tr><td>dlee99</td><td>голландский</td><td>nl_NL</td></tr>
			<tr><td>Eric Hameleers</td><td>голландский</td><td>nl_NL</td></tr>
			<tr><td>ponce</td><td>итальянский</td><td>it_IT</td></tr>
			<tr><td>celyr</td><td>итальянский</td><td>it_IT</td></tr>
			<tr><td>Sébastien Boillod</td><td>французский</td><td>fr_FR</td></tr>
			<tr><td>Didier Spaier</td><td>французский</td><td>fr_FR</td></tr>
			<tr><td>Marcin Herda</td><td>польский</td><td>pl_PL</td></tr>
			<tr><td>Piotr Maksymiec</td><td>польский</td><td>pl_PL</td></tr>
			<tr><td>elesmod</td><td>польский</td><td>pl_PL</td></tr>
			<tr><td>Christian Ruesch</td><td>немецкий</td><td>de_DE</td></tr>
			<tr><td>franzen</td><td>немецкий</td><td>de_DE</td></tr>
			<tr><td>Johannes Georgi</td><td>немецкий</td><td>de_DE</td></tr>
			<tr><td>Maik Wagner</td><td>немецкий</td><td>de_DE</td></tr>
			<tr><td>Marcel Saegebarth</td><td>немецкий</td><td>de_DE</td></tr>
			<tr><td>spongetron</td><td>немецкий</td><td>de_DE</td></tr>
			<tr><td>titopoquito</td><td>немецкий</td><td>de_DE</td></tr>
			<tr><td>Adriano Balani</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Enrico Nicoletto</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Fela</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Gabriel Magno</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Icavalheiro</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Retalhador</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>br_Orion</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>igaldino</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Malkon Rodrigo</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>marcelo.castro</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Xerxes Lins</td><td>португальский (бразильский)</td><td>pt_BR</td></tr>
			<tr><td>Dimitris Tzemos</td><td>греческий</td><td>el_GR</td></tr>
			<tr><td>dreamwalking</td><td>греческий</td><td>el_GR</td></tr>
			<tr><td>George Vlahavas</td><td>греческий</td><td>el_GR</td></tr>
			<tr><td>Diantre</td><td>испанский (латиноамериканский)</td><td>es_419</td></tr>
			<tr><td>AlvaroG</td><td>испанский (латиноамериканский)</td><td>es_419</td></tr>
			<tr><td>ecoslacker</td><td>испанский (латиноамериканский)</td><td>es_419</td></tr>
			<tr><td>sombragris</td><td>испанский (латиноамериканский)</td><td>es_419</td></tr>
			<tr><td>Serg Bormant</td><td>русский</td><td>ru_RU</td></tr>
			<tr><td>Сергей Игнатьев</td><td>русский</td><td>ru_RU</td></tr>
			<tr><td>Ярослав Шмелев</td><td>русский</td><td>ru_RU</td></tr>
			<tr><td>Graf</td><td>русский</td><td>ru_RU</td></tr>
			<tr><td>adioe3</td><td>боснийский (Босния и Герцеговина)</td><td>bs_BA</td></tr>
			<tr><td>willysr</td><td>индонезийский</td><td>id_ID</td></tr>
			<tr><td>kisil</td><td>украинский</td><td>uk_UA</td></tr>
			<tr><td>uatech</td><td>украинский</td><td>uk_UA</td></tr>
			<tr><td>xuser13</td><td>украинский</td><td>uk_UA</td></tr>
			<tr><td>Koljan1970</td><td>украинский</td><td>uk_UA</td></tr>
			<tr><td>Kemal Ökmen</td><td>турецкий</td><td>tr_TR</td></tr>
		</table>
		<p>При добавлении нового языка, он будет добавлен в установщик, новая версия
будет доступна в <a href="https://slint.fr/pub">этом каталоге</a>.</p>
		<h3><span>Давайте объединяться</span></h3>
		<p>Приветствуются любые помощь и участие.</p>
		<p>Надеемся, что перевод установщика может быть также полезен для основанных на
Slackware дистрибутивов.</p>
		<p> Приглашаем их пользователей и разработчиков поучаствовать в проекте slint.</p>
	</div>
</body>
</html>
