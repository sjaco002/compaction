#!/bin/sh

COUNTER=0
while [  $COUNTER -lt 3600 ]; do
	curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse experiments;
	for $i in dataset Tweets1
	where  $i.tweet_id > 0
	and $i.tweet_id < 5000
	return $i.id
	' http://localhost:19002/aql > errors.log
	echo The counter is $COUNTER
	let COUNTER=COUNTER+1
	sleep 1	
done


