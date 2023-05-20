#!/bin/sh
# We assume that the repository https://github.com/DidierSpaier/slint-translations has been cloned
# alongside https://github.com/DidierSpaier/slint-website
# Run this script from  the root of the clone of: https://github.com/DidierSpaier/slint-website

# The whole website accessed from https://slint.fr can be rebuilt locally after an update.
# We make a local rsync on the apache server: $WIP/html => /var/www/htdocs
# All pages are in folders by language, not in the web site directory.
# The header of each page will include the list of languages in which it is available
# This is true for:
# homepage => home.html
# support => support.html
# If a page is not translated in a given language, it will be displayed in English
# (through a hard link if that works).
# The list of languages will not be included in the header of the non translated pages only,
# i.e. translate and ChangeLog.
# All pages include a header with links to:
# Home Documentation Download Support Translate
# TODO: write a Packages and/or Software page.

# PO files use the ll_TT scheme, but unless there be several locales per language,
# We store the web pages in directories named $ll the per language directories we create, to store
# in them the English # verson of files not available in this language.
# We first need to build the header.html files. they include a line of links, then a line of
# languages in other languages in which each page is available
# To select the languages to include we need to know in which languages # each page has been
# translated. but as the 'support' pages are built extracting parts of the handbook we need only
# to check HandBook and homepage.
CWD="$(pwd)"
github=$(cd "$CWD" && cd .. && pwd)
ALL_LANGUAGES="de el en es fr it ja nl pl pt pt_BR ru sv uk"
WIP="$CWD/wip"
rm -rf "$WIP"
rm -rf "$CWD"/HandBook "$CWD"/HandBook14.2.1 "$CWD"/homepage "$CWD"/wiki
echo "Press Enter to continue or Ctrl+C to bail out."
read -r
mkdir -p "$WIP/html/doc"

SLINTDOCS="$github/slint-translations"
PAGES="home HandBook oldHandBook support wiki news"

feed_support_and_documentation() {
	# support is extracted from HandBook
	cp -a "$SLINTDOCS"/HandBook/ "$CWD"/
	cd "$CWD"/HandBook || exit 1
	msgen HandBook.pot -o en_US.HandBook.po
	langs="$(find . -name  "*po"|cut -d_ -f1)"
	header_handbook="$(echo "$langs"|sort|while read -r i; do echo "* link:../$i/HandBook.html[${i#./}] "; done)"
	header_support="$(echo "$langs"|sort|while read -r i; do echo "* link:../$i/support.html[${i#./}] "; done)"
	for handbookpo in *.HandBook.po; do
		ll_TT="${handbookpo%.*.*}"
		echo "$ll_TT" >> "$WIP"/languages
		ll="${ll_TT%_*}"
		cp ../headers/"$ll_TT".header.adoc "$WIP"
		{
		echo "$header_handbook"
		echo "--"
		echo
		echo 'toc::[left]'
		} >> "$WIP"/"$ll_TT".header.adoc
		po4a-translate -k 60 -M UTF-8 -m "$SLINTDOCS"/sources/HandBook/HandBook.adoc -f asciidoc -p "$handbookpo" -l "$WIP"/"${ll_TT}".HandBook.part.adoc
		cat "$WIP"/"$ll_TT".header.adoc "$WIP"/"${ll_TT}".HandBook.part.adoc > "$WIP"/"${ll_TT}".HandBook.adoc
		asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$SLINTDOCS"/css/slint.css -D "$WIP" -a doctype=book "$WIP"/"${ll_TT}".HandBook.adoc -o "$WIP"/html/"$ll"/HandBook.html
		sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/langmen/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@'  "$WIP"/html/"$ll"/HandBook.html
	done
	for handbookpo in *.HandBook.po; do
		ll_TT="${handbookpo%.*.*}"
		echo "$ll_TT" >> "$WIP"/languages
		ll="${ll_TT%_*}"
		cp ../headers/"$ll_TT".header.adoc "$WIP"
		{
		echo
		echo "$header_support"
		echo "--"
		echo
		echo 'toc::[]'
		} >> "$WIP"/"$ll_TT".header.adoc
		po4a-translate -M UTF-8 -m "$SLINTDOCS"/sources/HandBook/HandBook.adoc -f asciidoc -p "$handbookpo" -l "$WIP"/"${ll_TT}".HandBook.part.adoc
		sed -n "\@// Support@,\@// Acknowledgments@p" "$WIP"/"${ll_TT}".HandBook.part.adoc|head -n -1  \
		| sed "s@// .*@[.debut]@" >> "$WIP"/"${ll_TT}".support.part.adoc
		cat "$WIP"/"$ll_TT".header.adoc "$WIP"/"${ll_TT}".support.part.adoc > "$WIP"/"${ll_TT}".support.adoc
		asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$SLINTDOCS"/css/slint.css -D "$WIP" "$WIP"/"${ll_TT}".support.adoc -o "$WIP"/html/"$ll"/support.html
		sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/langmen/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@'  "$WIP"/html/"$ll"/support.html
	done
}
feed_news() {
	cp -a "$SLINTDOCS"/news/ "$CWD"/ || exit
	cd "$CWD"/news || exit 1
	msgen ./news.pot -o en_US.news.po
	langs="$(find . -name  "*po"|sed "s@..@@"|cut -d_ -f1)"
	header_news="$(echo "$langs"|sort|while read -r i; do echo "* link:../$i/news.html[${i#./}] "; done)"
	for newspo in *.news.po; do
		ll_TT=${newspo%.*.*}
		ll="${ll_TT%_*}"
		cp ../headers/"$ll_TT".header.adoc "$WIP"
		{
		echo "$header_news"
		echo
		echo "--"
		echo
		echo
		} >> "$WIP"/"$ll_TT".header.adoc
		pwd
		po4a-translate -k 40 -M UTF-8 -m "$SLINTDOCS"/sources/news/news.adoc -f asciidoc -p "$newspo" -l "$WIP"/"${ll_TT}".news.part.adoc
		sed "/:toc/d;/:sectnum/d" "$WIP"/"$ll_TT".header.adoc >"$WIP"/prov.adoc
		cat "$WIP"/prov.adoc "$WIP"/"${ll_TT}".news.part.adoc > "$WIP"/"${ll_TT}".news.adoc
		asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$SLINTDOCS"/css/slint.css -D "$WIP" -a doctype=book "$WIP"/"${ll_TT}".news.adoc -o "$WIP"/html/"$ll"/news.html
		sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/langmen/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@' "$WIP"/html/"$ll"/news.html
		sleep 1
	done
}
feed_homepage() {
	cp -a "$SLINTDOCS"/homepage/ "$CWD"/ || exit
	cd "$CWD"/homepage || exit 1
	msgen ./homepage.pot -o en_US.homepage.po
	langs="$(find . -name  "*po"|sed "s@..@@"|cut -d_ -f1)"
	header_homepage="$(echo "$langs"|sort|while read -r i; do echo "* link:../$i/home.html[${i#./}] "; done)"
	for homepagepo in *.homepage.po; do
		ll_TT=${homepagepo%.*.*}
		ll="${ll_TT%_*}"
		cp ../headers/"$ll_TT".header.adoc "$WIP"
		{
		echo "$header_homepage"
		echo
		echo "--"
		echo
		echo
		} >> "$WIP"/"$ll_TT".header.adoc
		pwd
		po4a-translate -k 40 -M UTF-8 -m "$SLINTDOCS"/sources/homepage/homepage.adoc -f asciidoc -p "$homepagepo" -l "$WIP"/"${ll_TT}".homepage.part.adoc
		sed "/:toc/d;/:sectnum/d" "$WIP"/"$ll_TT".header.adoc >"$WIP"/prov.adoc
		cat "$WIP"/prov.adoc "$WIP"/"${ll_TT}".homepage.part.adoc > "$WIP"/"${ll_TT}".homepage.adoc
		asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$SLINTDOCS"/css/slint.css -D "$WIP" -a doctype=book "$WIP"/"${ll_TT}".homepage.adoc -o "$WIP"/html/"$ll"/home.html
		sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/langmen/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@' "$WIP"/html/"$ll"/home.html
		sleep 1
	done
}
feed_wiki() {
	# Article of the wiki are translated one by one, not the wiki as whole.
	# We will mention the wiki as translated in a given language as soon as one of the articles has been translated.
	cp -a "$SLINTDOCS"/wiki/ "$CWD"/ || exit
	cd "$CWD"/wiki || exit 1
	locales="$(find . -name  "*po"|sed "s@.*/@@"|cut -d"." -f1|sort|uniq)"
locales="$locales
en_US"
	langs="$(find . -name  "*po"|sed "s@.*/@@"|cut -d_ -f1|sort|uniq)"
langs="$langs
en"
	# langs lists the two characters languages code in which at least one article has been translated.
	header_wiki="$(echo "$langs"|sort|while read -r i; do echo "* link:../$i/wiki.html[${i#./}] "; done)"
#echo "$header_wiki"
#echo "$langs"|sort|while read -r i; do echo "* link:../$i/wiki.html[${i#./}] "; done
	for ll_TT in $locales; do
		sed "/:toclevels: 2/d;/:sectnums:/d" ../headers/"$ll_TT".header.adoc > "$WIP"/"$ll_TT".wiki.adoc
		{
		echo "$header_wiki"
		echo
		echo "--"
		echo
		echo 'toc::[]'
		echo
		echo [.debut]
		} >> "$WIP"/"$ll_TT".wiki.adoc
		for article in $(ls); do
			articlepo="$SLINTDOCS"/wiki/"$article"/"${ll_TT}"."${article}".po
			if [ ! -f "$articlepo" ]; then
			# use the source asciidoc file for $article if not translated into $locale 
				cp "$SLINTDOCS/sources/wiki/$article/${article}.adoc" "$WIP"/"${ll_TT}"."${article}".adoc
			else
			# convert the PO file to asciidoc
			po4a-translate -M UTF-8 -m "$SLINTDOCS"/sources/wiki/$article/$article.adoc -f asciidoc -p "$articlepo" -l "$WIP"/"${ll_TT}"."$article".adoc
			fi
			# add the placeholder for $WIP"/"${ll_TT}".article.adoc in "WIP"/"$ll_TT".wiki.adoc
			echo "include::$WIP/${ll_TT}.${article}.adoc[ ]" >>"$WIP"/"$ll_TT".wiki.adoc
			echo >> "$WIP"/"$ll_TT".wiki.adoc
		done
		ll="${ll_TT%_*}"
		asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$SLINTDOCS"/css/slint.css -D "$WIP" -a doctype=book "$WIP"/"${ll_TT}".wiki.adoc -o "$WIP"/html/"$ll"/wiki.html
		sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/langmen/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@' "$WIP"/html/"$ll"/wiki.html
	done
}
feed_HandBook14_2_1() {
	cp -a "$SLINTDOCS"/sources/HandBook14.2.1 "$CWD"/ || exit 1
	cd "$CWD"/HandBook14.2.1 || exit 1
	langs=$(echo "de el en es fr it ja nl pl pt pt_BR ru sv uk"|sed "s/ /\n/g")
	header_oldhandbook="$(echo "$langs"|while read -r i; do echo "* link:../$i/oldHandBook.html[${i#./}] "; done)"
	for handbookadoc in *.HandBook.adoc; do
		ll_TT=${handbookadoc%.*.*}
		echo "$ll_TT" >> "$WIP"/languages
		ll=${ll_TT%_*}
		cp ../headers/"$ll_TT".header.adoc "$WIP"
		{
		echo
		echo "$header_oldhandbook"
		echo "--"
		echo
		echo 'toc::[]'
		} >> "$WIP"/"$ll_TT".header.adoc
		cat "$WIP"/"$ll_TT".header.adoc "$ll_TT".HandBook.adoc > "$WIP"/"${ll_TT}".oldHandBook.adoc
		if [ "$ll_TT" = "pt_BR" ]; then
			asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$SLINTDOCS"/css/slint.css -D "$WIP" -a doctype=book "$WIP"/"${ll_TT}".oldHandBook.adoc -o "$WIP"/html/"$ll_TT"/oldHandBook.html
			sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/langmen/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@'  "$WIP"/html/"$ll_TT"/oldHandBook.html
		else
			asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$SLINTDOCS"/css/slint.css -D "$WIP" -a doctype=book "$WIP"/"${ll_TT}".oldHandBook.adoc -o "$WIP"/html/"$ll"/oldHandBook.html
			sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/langmen/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@'  "$WIP"/html/"$ll"/oldHandBook.html
		fi
	done
}
complete_missing_with_english() {
	for i in $ALL_LANGUAGES; do
		for j in $PAGES; do
		[ ! -f "$WIP/html/$i/${j}.html" ] && cp "$WIP"/html/en/"${j}".html "$WIP"/html/"$i"/"${j}".html
		done
	done
}

cp "$CWD"/htaccess/.htaccess "$WIP"/html
cd "$CWD"/doc || exit 1
feed_news
feed_wiki
feed_homepage
feed_support_and_documentation
feed_HandBook14_2_1
complete_missing_with_english
cd "$CWD"/doc || exit 1
cp *.png "$WIP"/html/doc/
asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$CWD"/css/slint.css -D "$WIP" "$CWD"/doc/translate_slint.adoc -o "$WIP"/html/doc/translate_slint.html
sed -i 's@<p><a@<a@;s@</a></p>@</a>@;/"toc"/s@.*@<p></p>\n&@;/"toc"/s@.*@<p></p>\n&@' "$WIP"/html/doc/translate_slint.html
asciidoctor -a stylesdir=../css -a stylesheet=slint.css -a linkcss -a copycss="$CWD"/css/slint.css -D "$WIP" "$CWD"/doc/internationalization_and_localization_of_shell_scripts.adoc -o "$WIP"/html/doc/internationalization_and_localization_of_shell_scripts.html
cp "$CWD"/doc/shell_and_bash_scripts.html "$WIP"/html/doc/ || exit 1
sudo rsync --verbose -avP --exclude-from="$CWD"/exclude -H --delete-after "$CWD"/wip/html/ /var/www/htdocs/ 
rm -rf "$CWD"/homepage "$CWD"/wiki "$CWD"/HandBook "$CWD"/HandBook14.2.1 "$CWD"/news
