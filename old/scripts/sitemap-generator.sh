#!/bin/bash
echo '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' > sitemap.xml
find -name "*html"|sed 's|.|https://slint.fr|'|awk '{print "<url>\n<loc>" $0 "</loc>\n</url>"}' >> sitemap.xml
echo "</urlset>" >> sitemap.xml
