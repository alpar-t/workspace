#!/bin/bash 

while read -r line; do 
   if echo $line |  grep -v ^# ; then 
	   echo triggering $line
	   curl -s -H "Authorization: token ${GITHUB_TOKEN}" \
	      -X POST -d "{\"body\": \"$line\"}" \
	      "https://api.github.com/repos/elastic/cloud/issues/106672/comments"
	   sleep 0.2
   fi 
done < trigger.lst

