#!/bin/sh

RANDOM=$$
end=$((SECONDS+28800))
while [  $SECONDS -lt $end ]; do
	total=80300000
	rx=$(shuf -i 0-$total -n 1)
	curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; for \$i in dataset Tweets1 where  \$i.id = $rx return \$i.id" http://localhost:19002/aql > errors.log
	#echo $mx
	#echo $rx
	#echo $m
	#echo "\n"
	sleep 1	
done


