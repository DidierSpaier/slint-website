#!/bin/bash
# Initially witten by Didier Spaier 2014
# Public domain
# This script can be used to build a new POT file following the creation
# or update of a source asciidoc text file in $ROOT,
# check a PO file (usually coming from the Transifex platform and downloaded
# in a subdirectory of $TRANSLATIONS),
# or merge a PO file (update a PO file following an update of the relevant
# POT file. However, the merge is usally done automatically on the Transifex
# platform following an update (generally an upload) of the new POT file.
# The updated PO files downloaded from Transifex are processed by the
# script ./update_transations that store them in a subdirectory of $TARGET,
# checks them and convert them to asciidoc text files put in $ROOT, thus
# chacking PO files with toolbox.sh is only useful in specific cases like
# tests.
if [ $UID -eq 0 ]; then
  echo "Please execute this script as a regular user, not as root."
  exit
fi
TMP=$(mktemp -d)
ROOT=~/slint.fr
TARGET=$ROOT/po
TRANSLATIONS=~/MYENV/slintwebsite/translations
LOCALES=$(cat locales.txt)
PAGES=`ls $TRANSLATIONS|awk -F. '{print $2}'|sed 's/pot//'`
echo $LOCALES > $TMP/locales
echo $PAGES > $TMP/pages
get_locale () {
  LOCALE=""
  TITLE=" Which locale ? "
  while  [ "$LOCALE" = "" ];do
    dialog --no-collapse --title "$TITLE" \
    --inputbox "Please type the locale code. List of codes:\n \
$LOCALES" 8 80 2>$TMP/reply2
    INPUT="`cat $TMP/reply2`"
    rm -f $TMP/reply2
    LOCALE="`grep -wo $INPUT $TMP/locales`"
    if [ "$LOCALE" = "" ]; then
      TITLE="Care your typing! Which locale?"
    else
      export LOCALE
    fi
  done
}
get_page () {
  PAGE=""
  TITLE=" Which page ? "
  while [ "$PAGE" = "" ];do
    dialog --no-collapse --title "$TITLE" \
    --inputbox "Please type the page name. List of pages:\n \
$PAGES" 9 80 2>$TMP/reply2
   INPUT="`cat $TMP/reply2`"
   rm -f $TMP/reply2
   PAGE="`grep -wo $INPUT $TMP/pages`"
    if [ "$PAGE" = "" ]; then
      TITLE="Care your typing! Which page?"
    else
      export PAGE
    fi
  done
}
# This function generates a POT file in $TARGET/po/$PAGE
make_POT () {
  if [ -f $TARGET/$PAGE/${PAGE}.pot.prev ]; then
    echo "Remove $TARGET/$PAGE/${PAGE}.pot.prev, then go on." 
  else
    if [ -f $TARGET/$PAGE/${PAGE}.pot ]; then
    cp $TARGET/$PAGE/${PAGE}.pot $TARGET/$PAGE/${PAGE}.pot.prev
    fi
    po4a-gettextize -f asciidoc -m $ROOT/${PAGE}.en.txt -M UTF-8 \
    -p $TARGET/$PAGE/${PAGE}.pot \
    --package-name="$PAGE" --package-version="unknown" \
    --copyright-holder "The Slint project"
    sed -i 's/charset=CHARSET/charset=UTF-8/' $TARGET/$PAGE/${PAGE}.pot
    echo "The POT file $TARGET/$PAGE/${PAGE}.pot has been generated."
  fi
}
check_PO () {
  if [ ! -f $TARGET/$PAGE/${PAGE}.pot ]; then
    make_POT
  fi
  msgcmp $TARGET/$PAGE/${PAGE}.${LOCALE}.po \
  $TARGET/$PAGE/${PAGE}.pot 2>$TMP/foutput2
}
init_PO () {
  if [ ! -f $TARGET/$PAGE/${PAGE}.pot ]; then
    make_POT
  fi
  if [ -f $TARGET/$PAGE/${PAGE}.${LOCALE}.po ]; then
    echo "$TARGET/$PAGE/${PAGE}.${LOCALE}.po already exists" >$TMP/foutput
  elif [ ! -f $ROOT/${PAGE}.${LOCALE}.txt ]; then
    echo "$ROOT/${PAGE}.${LOCALE}.txt not found" >$TMP/foutput
  elif [ ! -f $ROOT/${PAGE}.en.txt ]; then
    echo "$ROOT/${PAGE}.en.txt not found" >$TMP/foutput
  else
    po4a-gettextize -f asciidoc -m $ROOT/${PAGE}.en.txt -p $TARGET/$PAGE/${PAGE}.${LOCALE}.po -l $ROOT/${PAGE}.${LOCALE}.txt -M UTF-8 -L UTF-8 2>$TMP/foutput
    echo "The PO file $TARGET/$PAGE/${PAGE}.${LOCALE}.po should have been generated." >>$TMP/foutput
  fi
}

# This function updates a PO file to follow up a modification of the
# reference POT file. The new file is written in ${ROOT}/wip.
merge_PO () {
  echo "$TARGET/$PAGE/${PAGE}.${LOCALE}.po.prev" > ~/prev
  if [ -f $TARGET/$PAGE/${PAGE}.${LOCALE}.po.prev ]; then
    echo "Remove $TARGET/po/$PAGE/${PAGE}.${LOCALE}.po.prev then go on" >$TMP/foutput
  elif [ ! -f $TARGET/$PAGE/${PAGE}.${LOCALE}.po ]; then
    echo "File $TARGET/po/$PAGE/${PAGE}.${LOCALE}.po not found" >$TMP/foutput
  else
    cp $TARGET/$PAGE/${PAGE}.${LOCALE}.po $TARGET/$PAGE/${PAGE}.${LOCALE}.po.prev
    msgmerge --strict --add-location -v -o $TARGET/$PAGE/${PAGE}.${LOCALE}.po \
    $TARGET/$PAGE/${PAGE}.${LOCALE}.po.prev $TARGET/$PAGE/${PAGE}.pot 2>$TMP/foutput
    echo "The new PO file $TARGET/$PAGE/${PAGE}.${LOCALE}.po is ready to \
be updated." >>$TMP/foutput
  fi
}
format_PO () {
  echo "Results of formatting command: 
  " >$TMP/foutput 
  MO=${PAGE}.${LOCALE}.mo
  msgfmt --strict -c -v --statistics \
  -o ${ROOT}/wip/${MO} \
  $TARGET/$PAGE/${PAGE}.${LOCALE}.po 2>>$TMP/foutput
  echo "
If the command was successull, ${ROOT}/wip/${MO} \
has been generated." >>$TMP/foutput
}
convert_TXT () {
  echo "Results of formatting command: 
  " >$TMP/foutput
  if [ ! -f ${ROOT}/wip_txt/${PAGE}.en.txt ]; then
    echo "${ROOT}/wip_txt/${PAGE}.en.txt not found" >>$TMP/foutput
  else

  po4a-translate -f asciidoc -m $ROOT/wip_txt/${PAGE}.en.txt -k 80 \
  -p $TARGET/${PAGE}/${PAGE}.${LOCALE}.po -l $ROOT/wip_txt/${PAGE}.${LOCALE}.txt\
  -M UTF-8 -L UTF-8  2>>$TMP/foutput
  echo "
If the command was successull, $ROOT/wip_txt/${PAGE}.${LOCALE}.txt \
has been generated." >>$TMP/foutput
  fi
}
convert_XHTML () {
  echo "Results of formatting command: 
  " >$TMP/foutput
  if [ ! -f ${ROOT}/wip_txt/${PAGE}.en.txt ]; then
    echo "${ROOT}/wip_txt/${PAGE}.en.txt not found" >>$TMP/foutput
  else
  asciidoc --backend=xhtml11 --attribute icons --conf-file=${ROOT}/slint.conf.en \
  --out-file=${ROOT}/wip_html/${PAGE}.html ${ROOT}/wip_txt/${PAGE}.en.txt 2>>$TMP/foutput
  echo "
If the command was successull, ${ROOT}/wip_html/${PAGE}.en.html \
has been generated." >>$TMP/foutput
  fi
}
# Main
while [ 0 ]; do
  dialog --title " Slint Website Toolbox " \
  --menu "Which option would you like?" 13 76 8 \
"make_POT" "Generate a new POT file" \
"init_PO" "Create a PO file from an asciidoc text one" \
"check_PO" "Ensure that all messages be translated in a PO file" \
"format_PO" "Format a PO file to check it" \
"merge_PO" "Update a PO file following an update of the POT file" \
"convert_TXT" "Convert a PO file to text" \
"convert_XHTML" "Convert a text page to xhtml" \
"Exit" "Stop using this toolbox" 2> $TMP/reply
  if [ ! $? = 0 ]; then
    rm -f $TMP/reply
    dialog --clear
    clear
    exit
  fi
  REPLY="$(cat $TMP/reply)"
  rm -f $TMP/reply
# make_POT
  if [ "$REPLY" = "make_POT" ]; then
    get_page
    Result="`$REPLY`"
    dialog --title " Results the command $REPLY " --msgbox \
    "$Result" 8 80
  fi

# init_PO
  if [ "$REPLY" = "init_PO" ]; then
    get_page
    get_locale
    init_PO
    dialog --title " Results of command: $REPLY $LOCALE" --msgbox "`cat $TMP/foutput`"  11 80
    rm -f $TMP/foutput
  fi
# check_PO
  if [ "$REPLY" = "check_PO" ]; then
    get_page
    get_locale
    make_POT
    check_PO
    if [ -s $TMP/foutput1 ]; then
      dialog --title " Results of command: $REPLY $LOCALE" --msgbox "`cat $TMP/foutput1`"  8 80
      rm -f $TMP/foutput1
    elif [ -s $TMP/foutput2 ]; then
      mv -f  $TMP/foutput2 ${TMP}/${REPLY}.${LOCALE}.log
      dialog \
      --title " Results of command: $REPLY $LOCALE" \
      --no-collapse --exit-label OK --msgbox \
      "There are untranslated strings in file:
$TARGET/$PAGE/${PAGE}.${LOCALE}.po
They are listed in file:
${TMP}/${REPLY}.${LOCALE}.log" 8 80
    else
      dialog \
      --title " Results of command: $REPLY $LOCALE" \
      --no-collapse --exit-label OK --msgbox \
      "All messages in POT file:
$TARGET/$PAGE/${PAGE}.pot
are translated in PO file:
$TARGET/$PAGE/${PAGE}.${LOCALE}.po
which could now be copied to:
$TRANSLATIONS/slintwebsite.${PAGE}pot" 10 80
    fi
  fi
# merge_PO
  if [ "$REPLY" = "merge_PO" ]; then
    get_locale
    get_page
    merge_PO
    dialog --title " Results of command: $REPLY $LOCALE" --msgbox "`cat $TMP/foutput`"  25 80
    rm -f $TMP/foutput
  fi
# format_PO
  if [ "$REPLY" = "format_PO" ]; then
    get_locale
    get_page
    format_PO
    dialog --title " Results of command: $REPLY $LOCALE" --msgbox "`cat $TMP/foutput`"  25 80
    rm -f $TMP/foutput
  fi
# convert_TXT
if [ "$REPLY" = "convert_TXT" ]; then
  get_locale
  get_page
  convert_TXT
  dialog --title " Results of command: $REPLY $LOCALE" --msgbox "`cat $TMP/foutput`"  25 80
  rm -f $TMP/foutput
fi
# convert_XHTML
if [ "$REPLY" = "convert_XHTML" ]; then
  get_page
  convert_XHTML
  dialog --title " Results of command: $REPLY $LOCALE" --msgbox "`cat $TMP/foutput`"  25 80
  rm -f $TMP/foutput
fi
# Exit
  if [ "$REPLY" = "Exit" ]; then
    dialog --clear
    rm -r $TMP
    clear
    echo "Thank you for having used this toolbox."
    echo
    exit
  fi
done
