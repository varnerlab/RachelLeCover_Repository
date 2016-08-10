#!/bin/bash

fn=$(echo $(find output/ -name "*Aug10R*"))
counter=1
for file in $fn	
do
	echo $counter
	while read line; 
	do
		echo $line
		cleanedtext=$(sed 's/\[//;s/\]//' $line)
		echo $cleanedtext >> "output/Aug10CleanedResPatchedSetSeedParamSet"$counter".txt"
	done <$file
	counter= $((counter+1))
done
