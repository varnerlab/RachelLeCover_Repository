#!/bin/bash	
while read line ;
do
	echo $line
	cleanedtext=$(echo $line | sed 's/\[//;s/\]//')
	echo $cleanedtext >> outputtesting.txt
done < testing.txt
