#!/bin/bash -x
RESULT=results.csv
TIMEOUT=$((60*10))
echo "Problem,Search Algorithm,Heuristic,Expansions,Goal Tests,New Nodes,Plan Length,Elapsed Time" > $RESULT
for problem in $(seq 1 3)
do 
	for alg in $(seq 1 10)
	do
		timeout $TIMEOUT python run_search_csv.py -p $problem -s $alg >> $RESULT
		if [ $? -eq 124 ]; then
			echo "$problem,$alg,timeout" >> $RESULT
		fi
	done
done
