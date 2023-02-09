#!/bin/sh

LOCAL_MIRROR=~/slint.fr
write_pages() {
  for i in `ls ${page}*txt`; do
    CONF_FILE=slint.conf.en
    ll=`echo $i|awk -F"." '{print $2}'`
    mkdir -p $ll
    if [ -f slint.conf.${ll} ]; then
      CONF_FILE=slint.conf.${ll}
    fi
    echo "Page ${page}.${ll}.txt processed"
    echo "Page ${page}.${ll}.txt processed" >> wip/list
    asciidoc -b xhtml11 -a icons -f $CONF_FILE -o $ll/${page}.html ${page}.${ll}.txt
    sed -i  "s|<head>|<head><base href=\"http://localhost/slint.fr/${ll}/index.html\" />|" $ll/${page}.html
    sed -i 's|./asciidoc.css|../asciidoc.css|' $ll/${page}.html
    sed -i 's|./slint.css|../slint.css|' $ll/${page}.html
    sed -i 's|./images|../images|' $ll/${page}.html
    sed -i 's|href="changelog"|href="changelog.html"|' $ll/${page}.html
    sed -i 's|href="contribute"|href="contribute.html"|' $ll/${page}.html
    sed -i 's|href="package#|href="package.html#|' $ll/${page}.html
    sed -i 's|href="translators"|href="translators.html"|' $ll/${page}.html
    sed -i 's|<div id="page-source"><a href="|<div id="page-source"><a href="../|' $ll/${page}.html
    for i in slint installer package translators contribute tools changelog; do
      sed -i 's|href="$i.html|href="$ll/$i.html|' $ll/${page}.html
    done
  done
}
( cd $LOCAL_MIRROR
for i in `cat languages`; do
  rm -f $i/*
done
rm -f wip/list
touch wip/list
for page in changelog contribute installer package tools translators; do
  if [ ! "`ls ${page}*txt|wc -l`" = "1" ]; then
     echo -n "|" > wip/languages
     for i in `ls ${page}*txt`; do
       ll=`echo $i|awk -F"." '{print $2}'`
       echo -n " <a href=\"../$ll/${page}.html\">$ll</a> |" >> wip/languages
     done
  fi
  write_pages
  rm -f wip/languages
done
page="slint"
echo -n "|" > wip/languages
for ll in `cat languages`; do
  if [ ! "$ll" = "zh_CN" ]; then
    echo -n " <a href=\"../$ll/index.html\">$ll</a> |" >> wip/languages
  fi
done
write_pages
rm -f wip/languages
for i in `cat languages`; do
  if [ "`grep $i migrated`" = "" ]; then
    ln -f oldhomepage/index.html.$i $i/index.html
  else
    if [ -f $i/slint.html ]; then
      ln -f $i/slint.html $i/index.html
    fi
  fi
  for j in slint installer package translators contribute tools changelog; do
    if [ ! -f $i/${j}.html ]; then
      ln -f en/${j}.html $i/${j}.html
    fi
  done
done
ln -f en/index.html index.html
cat wip/list|wc -l
rm -f wip/list
echo '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' > sitemap.xml
find -name *html|sed 's|.|https://slint.fr|'|awk '{print "<url>\n<loc>" $0 "</loc>\n</url>"}' >> sitemap.xml
echo "</urlset>" >> sitemap.xml
)






