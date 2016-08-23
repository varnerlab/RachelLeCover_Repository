#!/bin/bash

fn=$(echo $(find outputHemodilution/ -name "*Aug23O*"))
counter=1
for file in $fn	
do
	echo $counter
	while read line; 
	do
		#echo $counter
		cleanedtext=$(echo $line | sed 's/\[//;s/\]//')
		echo $cleanedtext >> "outputHemodilution/Aug23CleanedOneTenthInitialConditions"$counter".txt"
	done <$file
	counter=$((counter+1))
done
