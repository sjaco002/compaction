#!/bin/sh

RANDOM=$$
end=$((SECONDS+21600))
while [  $SECONDS -lt $end ]; do
	curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; count(for \$i in dataset Tweets1 return \$i.id)" http://localhost:19002/aql 
	sleep 3600
done


