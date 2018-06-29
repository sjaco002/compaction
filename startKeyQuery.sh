#!/bin/sh

#end=$((SECONDS+25200))
end=$((SECONDS+5))
while [  $SECONDS -lt $end ]; do
	cur_min=$(date +"%M")
	#if [ $cur_min -le 59 ]  && [ $cur_min -ge 30 ] 
	#then
	total=800000000
	rx=$(shuf -i 0-$total -n 1)
	curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; for \$i in dataset Tweets1 where  \$i.id = $rx return \$i.country" http://localhost:19002/aql 
	#fi	
	sleep 30	
done


