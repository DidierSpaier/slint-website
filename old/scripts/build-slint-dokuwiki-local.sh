#!/bin/sh

LOCAL_MIRROR=/home/didier/slint.fr
LOCAL_WIKI=/var/www/dokuwiki/data/pages/slint
cd $LOCAL_MIRROR
for i in `ls ${page}*txt`; do
	ll=`echo $i|awk -F"." '{print $2}'`
	mkdir -p $LOCAL_WIKI/$ll
	echo "convert $ll/$i" 
	DKROOT="" convtags ad $i > $LOCAL_WIKI/$ll/$i
done
chown -R apache:apache $LOCAL_WIKI






