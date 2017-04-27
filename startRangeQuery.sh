#!/bin/sh

RANDOM=$$
end=$((SECONDS+28800))
while [  $SECONDS -lt $end ]; do
	#seconds=$((SECONDS+1))
	#total=$((seconds * 2000))
	total=80300000
 	mx=$((total-5000))	
	rx=$(shuf -i 0-$mx -n 1)
        m=$((rx+5000))
	curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; for \$i in dataset Tweets1 where  \$i.id > $rx and \$i.id < $m return \$i.id" http://localhost:19002/aql > errors.log
	#echo $mx
	#echo $rx
	#echo $m
	#echo "\n"
	sleep 1	
done


