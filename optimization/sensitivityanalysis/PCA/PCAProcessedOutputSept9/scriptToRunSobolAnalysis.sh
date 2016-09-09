#!/bin/bash
for j in `seq 1 273`;
do
	echo $i
	python -m SALib.analyze.sobol -p boundsnoTauD25percent.txt -Y "PCScoresForPatient"$j".txt" -c 0 > "Patient"$j"SobolResults.txt"

done
