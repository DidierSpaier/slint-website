<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="el">
<head>
	<title>Slint: Έργο διεθνοποίησης του Slackware </title>
    <meta name="google-site-verification" content="LmAtE9by4Mg59SwZ0LyQq730fGtMZ0r0fqgkVurfPhc" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="Slackware internationalization Project" />
    <link rel="stylesheet" href="css/fp.css" type="text/css" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
</head>
<body>
  <div class="entete"> 
	Επιλέξτε την γλώσσα σας => | <a href="index.html.bs">bs</a> | <a
href="index.html.de">de</a> | <a href="index.html.el">el</a> | <a
href="index.html.en">en</a> | <a href="index.html.es">es</a> | <a
href="index.html.fr">fr</a> | <a href="index.html.id">id</a> | <a
href="index.html.it">it</a> | <a href="index.html.nl">nl</a> | <a
href="index.html.pl_PL">pl</a> | <a href="index.html.pt">pt</a> | <a
href="index.html.ru">ru</a> | <a href="index.html.tr_TR">tr</a> | <a
href="index.html.uk">uk</a> | 
  </div>
	<div id="hautdepage"></div>
	<h1> Έργο διεθνοποίησης του Slackware</h1>
	<div class="cadre w100">
		<h2 class="premierh2 center">Σχετικά με το slint</h2>
		<p>Ο απώτερος στόχος του έργου είναι ότι όλοι οι χρήστες μπορούν να
εγκαταστήσουν και να χρησιμοποιούν το Slackware Linux στη μητρική τους
γλώσσα.</p>
		<p>Αυτό θα μπορούσε να βοηθήσει στην επέκταση της βάσης των χρηστών του
Slackware, όπως και το Έργο Τεκμηρίωσης του Slackware που ήδη παρέχει
τεκμηρίωση σε πολλές γλώσσες.</p>
		<p>Αυτό εξακολουθεί να μην είναι μεταξύ των στόχων του Slackware και μόνο ο
συντηρητής του Slackware μπορεί να αποφασίσει να το συμπεριλάβει.</p>
		<p>Παρόλα αυτά το έργο Slint, το οποίο ούτε συνδέεται  ούτε είναι εγκεκριμένο
από το Slackware, είναι ένα βήμα προς αυτή την κατεύθυνση.</p>
	</div>
	<div class="cadre w50">
		<h2 class="premierh2">Χρησιμοποιώντας το slint</h2>
		<p>Το σχέδιο προβλέπει:</p>
		<ul>
			<li>Ένα πακέτο λογισμικού που επιτρέπεται πρώτον να περιέχει ένα διεθνοποιημένο
εγκαταστάτη σε ένα Slackware DVD, δεύτερον, να τον μεταφράσει σε
περισσότερες γλώσσες.</li>
			<li>διεθνοποιημένοι εγκαταστάτες για κάθε υποστηριζόμενη έκδοση του Slackware σε
δύο μορφές: ISO εικόνα για να καεί σε ένα CD ή DVD και εικόνα για να γραφτεί
σε ένα κλειδί USB.</li>
		</ul>
		<p>Μέχρι στιγμής ο διεθνοποιημένος εγκαταστάτης περιλαμβάνει:</p>
		<ul>
			<li>παραλλαγές για το Slackware-13.37, Slackware-14.0 και Slackware-14.1 (32 και
64 bit),</li>
			<li>μετάφραση στα γαλλικά, γερμανικά, πολωνικά, πορτογαλικά (Βραζιλίας), Ρωσικά,
Ισπανικά (Λατινικής Αμερικής) και της Ουκρανίας.</li>
		</ul>
        <h3><span>Χρησιμοποιώντας USB εικόνες ISO για διεθνοποιημένους
εγκαταστάτες</span></h3>
        <p>Πηγαίνετε στο υποκατάλογο του <a
href="https://slint.fr/pub">https://slint.fr/pub</a> που αντιστοιχεί στην
έκδοση για την οποία θέλετε ένα πρόγραμμα εγκατάστασης, για παράδειγμα <a
href="https://slint.fr/pub/64-14.1">https://slint.fr/pub/64-14.1</a> για το
Slackware64-14.1 και ακολουθήστε τις οδηγίες.
        </p>
        <p>Για να εγγράψετε ένα CD ή DVD του διεθνοποιημένου εγκαταστάτη για το
Slackware64-14.1:</p>
        <ul>
            <li>growisofs -speed=2 -dvd-compat -Z /dev/dvd=[όνομα αρχείου με κατάληξη .iso]</li>
        </ul>
        <p>Για να γράψετε τον διεθνοποιημένο εγκαταστάτη για το Slackware64-14.1 σε ένα
κλειδί USB που ονομάζεται /dev/sdc (π.χ., να αντικατασταθεί από το όνομα που
βρέθηκε στην πληκτρολόγηση 'cat /proc/partitions' ή 'dmesg|tail'):</p>
        <ul>
           <li>dd if=[όνομα αρχείου με κατάληξη .img] of=/dev/sdc bs=512</li>
        </ul>
        <p>ΠΡΟΕΙΔΟΠΟΙΗΣΗ:</p>
        <ul>
          <li>ελέγξτε καλά ότι το /dev/sdc (ή άλλο) δεν είναι το όνομα ενός σκληρού
δίσκου, εφόσον τα περιεχόμενα ΘΑ ΔΙΑΓΡΑΦΟΥΝ ΑΜΕΤΑΚΛΗΤΑ! </li>
          <li>Το προηγούμενο περιεχόμενο του κλειδιού USB θα διαγραφεί, έτσι να το
αποθηκεύσετε αλλού, πριν ξεκινήσετε, αν θέλετε να το κρατήσετε.</li>
        </ul>
        <p>ΣΗΜΕΙΩΣΗ. Για να εκτελέσετε την εγκατάσταση, θα πρέπει να έχετε, εκτός από
τον εγκαταστάτη, ένα μέσο των πακέτων λογισμικού για την ίδια έκδοση, για
παράδειγμα ένα Slackware DVD ή ένα τοπικό καθρέφτη, εφόσον αυτά τα πακέτα
δεν περιλαμβάνονται στις εικόνες ISO και USB. 
        </p>
		<h3><span>Χρήση του πακέτου λογισμικού <a
href="https://slint.fr/pub/slint-20140206.tar.xz">slint-[date].tar.xz</a></span></h3>
		<p>Θα χρειαστείτε, εκτός από το ίδιο πακέτο λογισμικού:</p>
		<ol>
			<li>Ένα πλήρη καθρέφτη της έκδοσης του Slackware που θέλετε να διεθνοποιήσετε:
ένα Slackware DVD, μια εικόνα ISO ή ένα τοπικό καθρέφτη.
			</li>
			<li>Μια διανομή Linux, συμπεριλαμβανομένων των εργαλείων 'gettext' και αρχείων
που χρειάζονται για τη διεθνοποίηση. Φυσικά, μια πλήρη εγκατάσταση Slackware
είναι προτιμότερη, αλλά μπορείτε να κατεβάσετε το slint και να το
χρησιμοποιήσετε σε ένα άλλο σύστημα Linux,
			</li>
		</ol>
		<p>Κατεβάστε <a href="https://slint.fr/pub/slint-20140206.tar.xz">το πακέτο
λογισμικού</a> και επίσης <a
href="https://slint.fr/pub/slint-20140206.tar.xz.md5">το αρχείο ελέγχου md5
</a> και στη συνέχεια, πληκτρολογήστε την ακόλουθη εντολή:</p>
		<ul>
			<li>md5sum -c slint-[date].tar.xz.md5 # η έξοδος θα πρέπει να είναι "OK"</li>
		</ul>
		<p>Στη συνέχεια αποσυμπιέστε το πακέτο:</p>
		<ul>
		   <li>tar xf slint-[date].tar.xz # Αυτό θα δημιουργήσει τον υποκατάλογο
slint-[ημερομηνία] </li>
		</ul>
		<p>Τέλος πληκτρολογήστε ως root:</p>
		<ul>
			<li>slint-[ημερομηνία]/slint.sh</li>
		</ul>
		<p>Ακολουθήστε τις οδηγίες του σεναρίου εντολών. Θα σας υποδειχθεί στην γραμμή
εντολών ποια έκδοση Slackware θέλετε να διεθνοποιήσετε. Το σενάριο εντολών
θα σας ζητήσει στη συνέχεια:</p>
		<ul>
			<li>τη διαδρομή προς τον τοπικό καθρέφτη της έκδοσης του Slackware που θέλετε να
διεθνοποιήσετε
			</li>
			<li>ποιες γλώσσες θέλετε να συμπεριλάβετε στο διεθνοποιημένο εγκαταστάτη (σε
περίπτωση που αναρωτιέστε γιατί τα Αγγλικά ΗΠΑ δεν είναι στη λίστα, είναι
επειδή πάντα περιλαμβάνονται :-)
			</li>
		</ul>
    </div>
	<div class="w50 cadresuivant">
		<h2 class="premierh2">Συνεισφέρετε στο slint</h2>
		<h3><span>Ανάγκη βοήθειας</span></h3>
		<p>Εξακολουθούμε να χρειαζόμαστε μεταφραστές για να ενισχυθούν οι υφιστάμενες
ομάδες και να γίνουν μεταφράσεις σε περισσότερες γλώσσες.</p>
		<p>Μπορείτε να ζητήσετε να συμμετάσχετε ή να δημιουργήσετε μια ομάδα μετάφρασης
στον ιστοχώρο του έργου στο <a
href="https://www.transifex.com/projects/p/slint/">Transifex</a>, δείτε το
αρχείο <a href = "https://slint.fr/pub/TRANSLATORS"> ΜΕΤΑΦΡΑΣΤΕΣ </a> για
λεπτομέρειες.</p>
		<p>Αλλά πρώτα ρίξτε μια ματιά στα <a href="https://slint.fr/slint"> αρχεία
slint</a> για να καταλάβετε το είδος και την ποσότητα της εργασίας που
απαιτείται.</p>
		<h3><span>Μεταφραστές και σχολιαστές καταχωρημένοι στο Transifex</span></h3>
		<table border="1">
			<tr><th>Μεταφραστής</th><th>Γλώσσα</th><th>Τοπικότητα</th></tr>
			<tr><td>dlee99</td><td>Dutch</td><td>nl_NL</td></tr>
			<tr><td>Eric Hameleers</td><td>Dutch</td><td>nl_NL</td></tr>
			<tr><td>ponce</td><td>Italian</td><td>it_IT</td></tr>
			<tr><td>celyr</td><td>Italian</td><td>it_IT</td></tr>
			<tr><td>Sébastien Boillod</td><td>French</td><td>fr_FR</td></tr>
			<tr><td>Didier Spaier</td><td>French</td><td>fr_FR</td></tr>
			<tr><td>Marcin Herda</td><td>Polish</td><td>pl_PL</td></tr>
			<tr><td>Piotr Maksymiec</td><td>Polish</td><td>pl_PL</td></tr>
			<tr><td>elesmod</td><td>Polish</td><td>pl_PL</td></tr>
			<tr><td>Christian Ruesch</td><td>German</td><td>de_DE</td></tr>
			<tr><td>franzen</td><td>German</td><td>de_DE</td></tr>
			<tr><td>Johannes Georgi</td><td>German</td><td>de_DE</td></tr>
			<tr><td>Maik Wagner</td><td>German</td><td>de_DE</td></tr>
			<tr><td>Marcel Saegebarth</td><td>German</td><td>de_DE</td></tr>
			<tr><td>spongetron</td><td>German</td><td>de_DE</td></tr>
			<tr><td>titopoquito</td><td>German</td><td>de_DE</td></tr>
			<tr><td>Adriano Balani</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Enrico Nicoletto</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Fela</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Gabriel Magno</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Icavalheiro</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Retalhador</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>br_Orion</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>igaldino</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Malkon Rodrigo</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>marcelo.castro</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Xerxes Lins</td><td>Brazilian Portuguese</td><td>pt_BR</td></tr>
			<tr><td>Dimitris Tzemos</td><td>Greek</td><td>el_GR</td></tr>
			<tr><td>dreamwalking</td><td>Greek</td><td>el_GR</td></tr>
			<tr><td>George Vlahavas</td><td>Greek</td><td>el_GR</td></tr>
			<tr><td>Diantre</td><td>Spanish (Latin America)</td><td>es_419</td></tr>
			<tr><td>AlvaroG</td><td>Spanish (Latin America)</td><td>es_419</td></tr>
			<tr><td>ecoslacker</td><td>Spanish (Latin America)</td><td>es_419</td></tr>
			<tr><td>sombragris</td><td>Spanish (Latin America)</td><td>es_419</td></tr>
			<tr><td>Serg Bormant</td><td>Russian</td><td>ru_RU</td></tr>
			<tr><td>Sergey Ignatev</td><td>Russian</td><td>ru_RU</td></tr>
			<tr><td>Yaroslav Shmelev</td><td>Russian</td><td>ru_RU</td></tr>
			<tr><td>Graf</td><td>Russian</td><td>ru_RU</td></tr>
			<tr><td>adioe3</td><td>Bosnian (Bosnia and Herzegovina)</td><td>bs_BA</td></tr>
			<tr><td>willysr</td><td>Indonesian</td><td>id_ID</td></tr>
			<tr><td>kisil</td><td>Ukrainian</td><td>uk_UA</td></tr>
			<tr><td>uatech</td><td>Ukrainian</td><td>uk_UA</td></tr>
			<tr><td>xuser13</td><td>Ukrainian</td><td>uk_UA</td></tr>
			<tr><td>Koljan1970</td><td>Ukrainian</td><td>uk_UA</td></tr>
			<tr><td>Kemal Ökmen</td><td>Tουρκικά</td><td>tr_TR</td></tr>
		</table>
		<p>Κάθε φορά που μια νέα γλώσσα θα είναι διαθέσιμη, θα πρέπει να προστεθεί στον
εγκαταστάτη και μια νέα έκδοση θα πρέπει να παρέχεται σε <a
href="https://slint.fr/pub">  αυτόν τον κατάλογο. </a></p>
		<h3><span>Ας συνεργαστούμε σαν ομάδα</span></h3>
		<p>Οποιοδήποτε είδος συνεισφοράς ή συμμετοχή είναι ευπρόσδεκτα.</p>
		<p>Επίσης, ο διεθνοποιημένος εγκαταστάτης θα μπορούσε να είναι χρήσιμος σε
διανομές που βασίζονται στο Slackware.</p>
		<p> Οι χρήστες και οι συντελεστές σε αυτές τις διανομές είναι ευπρόσδεκτοι να
τον χρησιμοποιήσουν και να συμβάλουν στο έργο slint.</p>
	</div>
</body>
</html>
