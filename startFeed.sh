#!/bin/sh

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=drop dataverse experiments if exists;
create dataverse experiments;
use dataverse experiments;

create type TwitterUserType as closed {
    screen_name: string,
    language: string,
    friends_count: int32,
    status_count: int32,
    name: string,
    followers_count: int32
}


create type TweetMessageType as closed {
    id: int64,
    user: TwitterUserType,
    latitude: float,
    longitude: float,
    message_text: string,
    created_at: string,
    country:string
}

' http://localhost:19002/aql > errors.log



curl -G -H "Accept: application/x-adm" -v --data-urlencode "aql=use dataverse experiments; $1" http://localhost:19002/aql > errors.log

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse experiments;
create feed TweetFeed using socket_adapter
(
    ("sockets"="127.0.0.1:10001"),
    ("address-type"="IP"),
    ("type-name"="TweetMessageType"),
    ("format"="adm")
);
' http://localhost:19002/aql > errors.log

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse experiments;
connect feed TweetFeed to dataset Tweets1;
' http://localhost:19002/aql > errors.log

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse experiments;
start feed TweetFeed;
' http://localhost:19002/aql > errors.log
