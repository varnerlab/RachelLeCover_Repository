#!/bin/bash

fn=$(echo $(find testingdata25percent/ -name "*.txt*"))
counter=1
for file in $fn	
do
	echo $counter
	while read line; 
	do
		#echo $counter
		cleanedtext=$(echo $line | sed 's/\[//;s/\]//')
		lenfn=${#file}
		#echo $lenfn
		desindex=$(($lenfn-3))
		echo $cleanedtext >> ""${file:0:desindex}"Cleaned"
	done <$file
	counter=$((counter+1))
done
