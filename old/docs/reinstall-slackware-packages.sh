#!/bin/sh
# This script replaces localized scripts installed by a Slint package
# by their genuine Slackware counterparts.
INSTALLED=$(find /var/log/packages/ -name "slint*")
REMOVED=$(find /var/log/removed_packages/ -name "slint*")
if [ "$INSTALLED" = "" ] && [ "$REMOVED" = "" ]; then
  echo "No Slint package was ever installed on this system. Nothing to do."
  exit
fi
if [ ! "$INSTALLED" = "" ]; then
  echo "Please remove the Slint package before running this script."
  exit
fi
if [ "$(find /var/log/packages/ -name "slackpkg-*")" = "" ];then
  echo "The package slackpkg should be installed before running this script."
  exit
fi
slackpkg reinstall "$(for i in $(cat $REMOVED|grep -e "usr/bin/." -e "usr/sbin/." -e "sbin/." -e "var/log/setup/."|sort|uniq);do
  grep $i /var/log/packages/*|sed 's:/var/log/packages/::'|awk -F : '{print $1}'
done|sort|uniq)"
