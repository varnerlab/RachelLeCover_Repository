#!/bin/bash
files=/home/rachel/Documents/work/optimization/sensitivityanalysis/PCA/PCAoutput25PercentMorrisN20/*
for f in $files;
do
	if [[ $f == *"PCscore"* ]] #only process files containing PC scores
	then 
		echo $f
		sed -i 's/^\s*//' $f #replace extra white space at front of lines
		python -m SALib.analyze.morris -p /home/rachel/Documents/work/optimization/sensitivityanalysis/usingSALib/boundsnoTauD25percent.txt -X /home/rachel/Documents/work/optimization/sensitivityanalysis/usingSALib/morrisParamsN20.txt -Y $f -c 0 > "./MorrisOuputdata25PercentN20/"${f: -27}"MorrisResults.txt"
	fi

done
