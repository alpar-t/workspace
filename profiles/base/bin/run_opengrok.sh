#!/bin/bash
if [ $1 == "" ] ;  then 
    echo "usage: $0 Path_to_Index"
    exit 1
fi
NAME="opengrok-`basename $1`" 
if docker ps | grep -q $NAME ; then 
    echo $NAME allready running
else
    if docker ps -a | grep -q $NAME ; then
        echo "$NAME allready exists. Starting it up."
        docker start "$NAME"
    else        
        # brand new 
        docker run --name "$NAME" -d -v $1:/src -p 80:8080 steinwaywhw/opengrok
    fi
fi
