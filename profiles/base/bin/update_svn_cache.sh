#!/bin/bash

#
# Simple script to maintain a cached local copy of critical compontens
#

COMP="buildsystem osprov rpm"
BR=${1-trunk}
CACHEDIR=${CACHEDIR-~/cache}
if [ -z "$REPO" ] ; then
	REPO=https://svn01.atlanta.hp.com/local/hpsa-svn
fi

for comp in $COMP ; do
	echo "Updating $BR/$comp"
	mkdir -p $CACHEDIR/$BR
	cd $CACHEDIR/$BR
	if [ -d $comp ] ;  then
		cd $comp 
		svn up
	else
		svn co $REPO/$BR/$comp
	fi
done

