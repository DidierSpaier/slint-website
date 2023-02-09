#!/bin/sh

LOCAL_MIRROR=~/slint.fr
write_pages() {
  for i in `ls ${page}*txt`; do
    # CONF_FILE will be used as argument of the -f option of asciidovc when
    #  building the web pages. It includes the left hand menu, localized if
    # available, else using the english version as a fall back.
    CONF_FILE=slint.conf.en
    ll=`echo $i|awk -F"." '{print $2}'`
    mkdir -p $ll
    if [ -f slint.conf.${ll} ]; then
      CONF_FILE=slint.conf.${ll}
    fi
    echo "Page ${page}.${ll}.txt processed"
    echo "Page ${page}.${ll}.txt processed" >> wip/list
    asciidoc -b xhtml11 -a icons -f $CONF_FILE -o $ll/${page}.html ${page}.${ll}.txt
    sed -i 's|./asciidoc.css|../asciidoc.css|' $ll/${page}.html
    sed -i 's|./slint.css|../slint.css|' $ll/${page}.html
    sed -i 's|./images|../images|' $ll/${page}.html
    sed -i 's|href="changelog"|href="changelog.html"|' $ll/${page}.html
    sed -i 's|href="contribute"|href="contribute.html"|' $ll/${page}.html
    sed -i 's|href="package#|href="package.html#|' $ll/${page}.html
    sed -i 's|href="translators"|href="translators.html"|' $ll/${page}.html
    sed -i 's|<div id="page-source"><a href="|<div id="page-source"><a href="../|' $ll/${page}.html
    sed -i 's|<meta name="generator"|<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1" />\n<meta name="generator"|' $ll/${page}.html
    for i in slint installer package translators contribute tools changelog; do
      sed -i 's|href="$i.html|href="$ll/$i.html|' $ll/${page}.html
    done
  done
}
( cd $LOCAL_MIRROR
# the file languages lists all available languages
for i in `cat languages`; do
  rm -f $i/*
done
rm -f wip/list
touch wip/list
# The pages listed here are those possibly localized of the website plus a
# fall back for error 404
for page in changelog contribute installer package slint tools translators sorry_the_requested_resource_was_not_found; do
  if [ ! "`ls ${page}*txt|wc -l`" = "1" ]; then
  # We build the list of available languages for that page in the top menu. 
     echo -n "|" > wip/languages
     for i in `ls ${page}*txt`; do
       ll=`echo $i|awk -F"." '{print $2}'`
       echo -n " <a href=\"../$ll/${page}.html\">$ll</a> |" >> wip/languages
     done
  fi
  if [ ! -f wip/languages ]; then
    touch wip/languages
  fi
  write_pages
  rm -f wip/languages
done
# If a localized page is not available we link to the English one instead.
for i in `cat languages`; do 
  for j in slint installer package translators contribute tools changelog sorry_the_requested_resource_was_not_found ; do
    if [ ! -f $i/${j}.html ]; then
      ln -f en/${j}.html $i/${j}.html
    fi
  done
done
cp -f en/index.html index.html
mv -f en/sorry_the_requested_resource_was_not_found.html .
sed -i "s|<head>|<head>\n<base href=\"https://slint.fr/en/index.html\" />|" index.html sorry_the_requested_resource_was_not_found.html
cat wip/list|wc -l
rm -f wip/list
# Provide a sitemap for the spidersyyy
echo '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' > sitemap.xml
find -name "*html"|sed 's|.|https://slint.fr|'|awk '{print "<url>\n<loc>" $0 "</loc>\n</url>"}' >> sitemap.xml
echo "</urlset>" >> sitemap.xml
)






