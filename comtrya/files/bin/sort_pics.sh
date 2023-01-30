#!/bin/bash

if [ -z "$2" ] ; then 
       echo "No tag is set"	
       TAG=""
else
       TAG="-$2"
       echo "The TAG is: $TAG"
fi

exiftool -r '-FileName<CreateDate' -d "%Y/%m/%%le$TAG/%Y-%m-%d_%H_%M_%S%%-c.%%le" $1
find $1 -depth -empty -delete
