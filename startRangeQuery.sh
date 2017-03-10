#!/bin/sh

end=$((SECONDS+3600))
while [  $SECONDS -lt $end ]; do
	seconds=$((SECONDS+1))
	mx=$((seconds * 9000 - 5000))
        rx=$(($RANDOM%mx))
        m=$((rx+5000))
	curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; for \$i in dataset Tweets1 where  \$i.tweet_id > $rx and \$i.tweet_id < $m return \$i.id" http://localhost:19002/aql > errors.log
	echo $rx
	sleep 1	
done


