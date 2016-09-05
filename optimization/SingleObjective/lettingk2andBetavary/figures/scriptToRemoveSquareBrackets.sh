#!/bin/bash

fn=$(echo $(find Sept1/ -name "*.txt*"))
counter=1
for file in $fn	
do
	echo $counter
	while read line; 
	do
		#echo $counter
		cleanedtext=$(echo $line | sed 's/\[//;s/\]//')
		echo $cleanedtext >> ""$file"Cleaned.txt"
	done <$file
	counter=$((counter+1))
done
