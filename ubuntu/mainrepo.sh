#!/bin/bash

country=`curl -s ipinfo.io | grep country | awk -F":" '{print $2}' | cut -d '"' -f2`

srcfile="/etc/apt/sources.list"
if [ "$country" == "ID" ] ; then
  echo "deb http://mirror.unej.ac.id/ubuntu `lsb_release -cs` main restricted universe multiverse" > $srcfile
  echo "deb http://mirror.unej.ac.id/ubuntu `lsb_release -cs`-updates main restricted universe multiverse" >> $srcfile
  echo "deb http://mirror.unej.ac.id/ubuntu `lsb_release -cs`-security main restricted universe multiverse" >> $srcfile
  echo "deb http://mirror.unej.ac.id/ubuntu `lsb_release -cs`-backports main restricted universe multiverse" >> $srcfile
elif [ "$country" == "SG" ] ; then
  echo "deb http://mirror.0x.sg/ubuntu `lsb_release -cs` main restricted universe multiverse" > $srcfile
  echo "deb http://mirror.0x.sg/ubuntu `lsb_release -cs`-updates main restricted universe multiverse" >> $srcfile
  echo "deb http://mirror.0x.sg/ubuntu `lsb_release -cs`-security main restricted universe multiverse" >> $srcfile
  echo "deb http://mirror.0x.sg/ubuntu `lsb_release -cs`-backports main restricted universe multiverse" >> $srcfile
else
  echo "deb http://azure.archive.ubuntu.com/ubuntu `lsb_release -cs` main restricted universe multiverse" > $srcfile
  echo "deb http://azure.archive.ubuntu.com/ubuntu `lsb_release -cs`-updates main restricted universe multiverse" >> $srcfile
  echo "deb http://azure.archive.ubuntu.com/ubuntu `lsb_release -cs`-security main restricted universe multiverse" >> $srcfile
  echo "deb http://azure.archive.ubuntu.com/ubuntu `lsb_release -cs`-backports main restricted universe multiverse" >> $srcfile
fi