#!/bin/sh
# This scripts copies the recently updated files from $TRANSLATIONS to $LOCAL_MIRROR/po
# and puts the converted to asciidoc text files in $LOCAL_MIRROR/wip_txt
# It also puts the html pages from generated from the asciidoc text files in $LOCAL_MIRROR/wip_html
LOCAL_MIRROR=~/slint.fr
TRANSLATIONS=~/MYENV/slintwebsite/translations
( cd $LOCAL_MIRROR
for j in `ls $TRANSLATIONS/slintwebsite.templatepot`; do
  ll=`echo $j|awk -F"." '{print $2}'`
  if [ ! -f po/template/$j ] || [ ! "`diff $TRANSLATIONS/slintwebsite.templatepot/$j po/template/$j`" = "" ] || [ ! -f slint.conf.$ll ]; then
    cp -f $TRANSLATIONS/slintwebsite.templatepot/$j po/template
    po4a-translate -f xhtml -m slint.conf.en -p po/template/$j -l wip_html/slint.conf.$ll
  fi
done
echo "first part done"
if [ "$PAGES" = "" ]; then
  PAGES=`cat scripts/pages.txt`
fi
for PAGE in $PAGES; do
  for TRANSLATION_PO in `ls $TRANSLATIONS/slintwebsite.${PAGE}pot`; do
    if [ ! -f po/$PAGE/$TRANSLATION_PO ] || \
    [ ! "`diff po/$PAGE/$TRANSLATION_PO $TRANSLATIONS/slintwebsite.${PAGE}pot/$TRANSLATION_PO`" = "" ]; then
      if [ -f prev/${TRANSLATION_PO} ]; then
        echo "Remove prev/${TRANSLATION_PO} then go on"
        exit
      fi
      if [ -f po/$PAGE/$TRANSLATION_PO ]; then
        mv po/$PAGE/$TRANSLATION_PO prev
      fi
      cp $TRANSLATIONS/slintwebsite.${PAGE}pot/$TRANSLATION_PO po/$PAGE
      PAGE_SOURCE=${PAGE}.en.txt
      TRANSLATION_TXT=${TRANSLATION_PO%.po}.txt
      po4a-translate -f asciidoc -m $PAGE_SOURCE -k 70 -p po/$PAGE/${TRANSLATION_PO} -l wip_txt/$TRANSLATION_TXT -M UTF-8 -L UTF-8
      if [ -f wip_txt/$TRANSLATION_TXT ]; then
        ll=`echo $TRANSLATION_TXT|awk -F"." '{print $2}'`
        CONF_FILE=slint.conf.en
        if [ -f wip_html/slint.conf.$ll ]; then
          CONF_FILE=wip_html/slint.conf.$ll
        elif [ -f slint.conf.$ll ]; then
          CONF_FILE=slint.conf.$ll
        fi
        asciidoc --backend=xhtml11 --attribute icons --conf-file=$CONF_FILE --out-file=wip_html/${PAGE}.html.${ll} wip_txt/$TRANSLATION_TXT
      fi
    fi
  done
done
)
