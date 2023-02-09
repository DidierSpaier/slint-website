#!/bin/sh
# This script is intended to build only a few wen pages, intead of re-generating
# the whole website, as does buid-slint-website.sh.
# The pages built are those for which a source text file is found in
# ~/slint.fr/wip_txt
#  
LOCAL_MIRROR=~/slint.fr
write_updated() {
  # CONF_FILE will be used as argument of the -f option of asciidoc when
  #  building the web page. It includes the left hand menu, localized if
  # available, else using the english version as a fall back.
  CONF_FILE=slint.conf.en
  if [ -f slint.conf.${ll} ]; then
    CONF_FILE=slint.conf.${ll}
  fi
  echo "Page $updated processed"
  echo "Page $umdated processed" >> wip/list
  asciidoc -b xhtml11 -a icons -f $CONF_FILE -o $ll/${page}.html $updated
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
}
( cd $LOCAL_MIRROR
# the file languages lists all languages with at least one localized page.
# The pages listed here are those possibly localized of the website plus a
# fall back for error 404
for updated in `find wip_txt -name "*.txt" -exec basename '{}' \;`; do
  echo $updated
  if [ -f "$updated" ]; then
    if [ ! -f "${updated}.bak" ]; then
      mv $updated ${updated}.bak
      mv wip_txt/$updated .
      page=${updated%%.*}
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
      ll=`echo $updated|awk -F"." '{print $2}'`
      mkdir -p $ll
      if [ -f $ll/${page}.html ]; then
        if [ ! -f $ll/${page}.html.bak ]; then
          mv $ll/${page}.html $ll/${page}.html.bak
          write_updated
          rm -f wip/languages
        else
          echo "$updated was not updated. Take care of $ll/${page}.html.bak first."
        fi
      fi
    else
      echo "$updated was not updated. Take care of ${updated}.bak first."
    fi
  else
    echo "No $updated found in $LOCAL_MIRROR. If it is a new translation, run"
    echo "build-slint-website to include it."
  fi
done
)






