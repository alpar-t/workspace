#!/bin/bash
if [ $1 == "" ] ;  then 
    echo "usage: $0 Path_to_Index"
    exit 1
fi
docker run -d -v $1:/src -p 80:8080 steinwaywhw/opengrok
