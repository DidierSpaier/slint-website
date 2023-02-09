#!/bin/sh
# This script build POT files from source asciidoc text files in $LOCAL_MIRROR
LOCAL_MIRROR=~/slint.fr
TRANSLATIONS=`ls ~/MYENV/slintwebsite/translations`
for PAGE_WHOLE_NAME in $TRANSLATION; do
 PAGEPOT=${PAGE_WHOLAEE_N#slintwebsite.}
 PAGE=${PAGEPOT%pot}
 PAGE_SOURCE=$LOCAL_MIRROR/$PAGE.en.txt
 if [ -f $LOCAL_MIRROR/po/$PAGE/$PAGE.pot.orig ]; then
   echo "Please remove $LOCAL_MIRROR/po/$PAGE/$PAGE.pot.orig then restart the script"
   exit
 fi
 if [ -f $LOCAL_MIRROR/po/$PAGE/$PAGE.pot ]; then
   mv $LOCAL_MIRROR/po/$PAGE/$PAGE.pot  $LOCAL_MIRROR/po/$PAGE/$PAGE.pot.orig
 fi
 po4a-translate -f asciidoc -m $PAGE_SOURCE -p po/$PAGE/${TRANSLATION_PO} -M UTF-8

