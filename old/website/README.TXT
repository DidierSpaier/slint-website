This directory's content will help you check the rendering of a web page
generated from your translation of a source text file in AsciiDoc format.

1) Download this directory and its content
     lftp -c "mirror https://slint.fr/website/"
   This whill create the directory "website"
2) Copy to "website" the file you want to check, for instance "translation.txt":
     cp translation.txt website
3) Change directory to "website" and generate the web page:
     cd website
     asciidoc -b xhtml11 -a icons -f ${CONFIG_FILE:-slint.conf.en} translation.txt
   You will get the file "translation.html". 
4) Check the web page with a browser, for instance:
     firefox translation.html

When everything is OK send the translated text page (*not* the web page) to:
  didier (at) slint (dot) fr
named:
  <page name>.<language>.txt
for instance the page "package" translated to Persian should be named:
  package.fa.txt

Optional: you can include as $CONFIG_FILE in the asciidoc command above
the name of the config file translated to your language, if also copied to
the directory "website". For instance:
  export CONFIG_FILE=slint.conf.fa
  asciidoc -b xhtml11 -a icons -f ${CONFIG_FILE:-slint.conf.en} package.fa.txt
  firefox package.fa.html&
