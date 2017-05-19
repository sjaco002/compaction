#!/bin/sh

RANDOM=$$
end=$((SECONDS+21600))
while [  $SECONDS -lt $end ]; do
	total=803000000
	rx=$(shuf -i 0-$total -n 1)
	curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; for \$i in dataset Tweets1 where  \$i.id = $rx return \$i.country" http://localhost:19002/aql 
	#echo $mx
	#echo $rx
	#echo $m
	#echo "\n"
	sleep 1	
done


