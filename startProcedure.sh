#!/bin/sh


curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse experiments;
create procedure probeTweets(){
for $i in dataset search
for $j in dataset Tweets1
where  $i.tweet_id /* +indexnl */= $j.id
return $j.id
} period duration("PT.005S");
' http://localhost:19002/aql > errors.log

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse experiments;
execute probeTweets();
' http://localhost:19002/aql > errors.log

