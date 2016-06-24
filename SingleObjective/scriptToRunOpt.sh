#!/bin/bash
#julia attemptOptimization.jl 75.27618278049394 3.2027945774762436 2.2027945774762436 249.3694612441427 0.9805723552540232 2.2027945774762436 1.9932439525253 0.3040449298196831 0.5097563805835272
end=$((SECONDS+60*60*200)) 
while [ $SECONDS -lt $end ]; do
	totMemUsed=$(ps -C julia -o pmem= --sort=-pmem|paste -sd+| bc) #get total memory being used by julia as a percent
	killThreshold=65.0
	aboveKillThreshold=$(echo "$totMemUsed > $killThreshold" |bc -l)

	if [ $(($SECONDS % 100)) -eq 0 ] ; then
		echo $totMemUsed
		echo "script has been running for $SECONDS seconds"
	fi
	

	if [ $aboveKillThreshold -eq 1 ] ; then
		echo "Should kill process, restart with last values"
		paramoutputfilename=$(find moretesting/forcepositivity/usingScriptToRestartAgainParallel/ -name "*params*" -print0 |xargs -0 ls -Art | tail -n 1) #find most recently updated parameter file
		lastline=$(tail $paramoutputfilename -n 1)
		indexofclose=$(echo $lastline|awk 'END{print index($0,"]")}')
		paramsunformated=$(echo ${lastline:0:$indexofclose})
		nobrakets=$(echo $paramsunformated|sed 's/\(\[\|\]\)//g')
		paramstouse=$(echo ${nobrakets//,/' '})
		echo $paramoutputfilename
		echo $lastline
		echo $indexofclose
		echo $paramstouse
		ps -ef | grep "julia -p" | grep -v grep | awk '{print $2}' | xargs -r kill -9 #kill all julia with multiple processors processes
		sleep 60 #wait 10 seconds before starting code again
		gnome-terminal -e "julia -p 8 attemptOptimization.jl $paramstouse" #restart with the newer parameters
	fi
done


