#!/bin/bash

fn=$(echo $(find outputOct6/600s -name "*patient*"))
counter=1
for file in $fn	
do
	echo $counter
	while read line; 
	do
		#echo $counter
		cleanedtext=$(echo $line | sed 's/\[//;s/\]//')
		echo $cleanedtext >> "outputOct6/600s/Cleanedfor_patients30170-3316-05-20-10-48nset"$counter".txt"
	done <$file
	counter=$((counter+1))
done
