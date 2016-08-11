#!/bin/bash
rsync -rtv --delete  $USER@$SYNC_SERVER::documents/$1 $2 
