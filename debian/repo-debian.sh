#!/bin/bash

if [[ $EUID -ne 0 ]]; then echo -e 'This script must be run as root' ; exit 1 ; fi

country=`curl -s ipinfo.io | grep country | awk -F":" '{print $2}' | cut -d '"' -f2`

srcfile="/etc/apt/sources.list"
if [ "$country" == "ID" ] ; then
  echo "deb http://kebo.pens.ac.id/debian `lsb_release -cs` main contrib non-free" > $srcfile
  echo "deb http://kebo.pens.ac.id/debian `lsb_release -cs`-updates main contrib non-free" >> $srcfile
  echo "deb http://kebo.pens.ac.id/debian-security `lsb_release -cs`/updates main contrib non-free" >> $srcfile
elif [ "$country" == "SG" ] ; then
  echo "deb http://mirror.0x.sg/debian `lsb_release -cs` main contrib non-free" > $srcfile
  echo "deb http://mirror.0x.sg/debian `lsb_release -cs`-updates main contrib non-free" >> $srcfile
  echo "deb http://security.debian.org/debian-security `lsb_release -cs`/updates main contrib non-free" >> $srcfile
else
  echo "deb http://debian-archive.trafficmanager.net/debian `lsb_release -cs` main contrib non-free" > $srcfile
  echo "deb http://debian-archive.trafficmanager.net/debian `lsb_release -cs`-updates main contrib non-free" >> $srcfile
  echo "deb http://debian-archive.trafficmanager.net/debian-security `lsb_release -cs`/updates main contrib non-free" >> $srcfile
fi

echo 'Repository has been configured'
