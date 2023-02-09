# slint-website

This repository hosts the files allowing to (re)build the website https://slint.fr but the files in ./packages and ./installers, ./pub and ./forSlackware

Requirements to build a local copy of the website:
* an Apache server, server root assumed to be /var/www/htdocs
* `asciidoctor`
* `rsync`
* a shell able to work in POSIX mode
* clones of https://github.com/DidierSpaier/slint-translations and https://github.com/DidierSpaier/slint-website in the same directory

To build the copy of the website, run: sh build_website.sh from the root of this cloned directory.
