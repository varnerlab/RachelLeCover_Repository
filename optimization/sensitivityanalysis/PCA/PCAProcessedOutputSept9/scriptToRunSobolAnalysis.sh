#!/bin/bash
files=/home/rachel/Documents/work/optimization/sensitivityanalysis/PCA/PCAoutput25PercentMorrisN20/
for f in $files;
do
	echo $f
	python -m SALib.analyze.morris -p /home/rachel/Documents/work/optimization/sensitivityanalysis/usingSALib/morrisParamsN20.txt -X $f -c 0 > $f"MorrisResults.txt"

done
