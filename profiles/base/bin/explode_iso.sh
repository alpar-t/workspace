#!/bin/bash
#
# Explode iso
#
ISO=$1
LOC=$2
set -e

if ! [ -d `dirname $LOC` ] ; then
    echo `dirname $LOC` not a direcotry
    exit 1
fi  
mkdir -p $LOC

if ! [ -f $ISO ] ; then
    echo $ISO not a file
    exit 1
fi  

MNT_DIR=/tmp/explode_`basename $ISO`
mkdir $MNT_DIR
sudo mount -o loop $ISO $MNT_DIR
cp -R $MNT_DIR/* $LOC
echo "$ISO by $USER" > $LOC/README.opsware
sudo umount $MNT_DIR
rm -Rf MNT_DIR
for dir in `find $LOC -type d` ; do
   chmod 555  $dir
   chmod 444  $dir/*
done

