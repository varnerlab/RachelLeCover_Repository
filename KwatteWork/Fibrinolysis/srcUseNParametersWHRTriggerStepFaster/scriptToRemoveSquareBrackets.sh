#!/bin/bash

fn=$(echo $(find outputOct31/60s/ -name "*patient*"))
counter=1
for file in $fn	
do
	echo $counter
	while read line; 
	do
		#echo $counter
		cleanedtext=$(echo $line | sed 's/\[//;s/\]//')
		echo $cleanedtext >> "outputOct31/60s/Cleanedfor_patients28611-3018-03-06-18-24nset"$counter".txt"
	done <$file
	counter=$((counter+1))
done
