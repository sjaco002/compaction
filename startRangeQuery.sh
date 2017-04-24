#!/bin/sh

RANDOM=$$
end=$((SECONDS+86400))
while [  $SECONDS -lt $end ]; do
	seconds=$((SECONDS+1))
	total=$((seconds * 2000))
 	mx=$((total-5000))	
	rx=$(shuf -i 0-$mx -n 1)
        m=$((rx+5000))
	curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; for \$i in dataset Tweets1 where  \$i.tweet_id > $rx and \$i.tweet_id < $m return \$i.id" http://localhost:19002/aql > errors.log
	echo $seconds
	echo $mx
	echo $rx
	echo $m
	sleep 1	
done


