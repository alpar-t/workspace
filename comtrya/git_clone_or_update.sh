#!/bin/bash 

TARGET=$1
REPO=$2

if ! [ -d $TARGET ] ; then 
  git clone --recursive $REPO $TARGET
fi

cd $TARGET
git config pull.rebase true 
git pull


