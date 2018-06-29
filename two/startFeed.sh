#!/bin/sh

curl -H "Accept: application/x-adm" -v --data-urlencode 'statement=drop dataverse experiments if exists;
create dataverse experiments;
use experiments;

create type TweetMessageType as closed {
    id: int64,
    message_text: string,
    created_at: string,
    country:string
};

' http://127.0.0.1:19002/query/service > errors.log



curl -H "Accept: application/x-adm" -v --data-urlencode "statement=use experiments; $1" http://127.0.0.1:19002/query/service > errors.log

curl -H "Accept: application/x-adm" -v --data-urlencode 'statement=use experiments;

create feed TweetFeed with
{
    "adapter-name" : "socket_adapter",
    "sockets" : "127.0.0.1:10001",
    "address-type" : "IP",
    "type-name" : "TweetMessageType",
    "format" : "adm"
};

' http://127.0.0.1:19002/query/service > errors.log

curl -H "Accept: application/x-adm" -v --data-urlencode 'statement=use experiments;
connect feed TweetFeed to dataset Tweets1;
' http://127.0.0.1:19002/query/service > errors.log

curl -H "Accept: application/x-adm" -v --data-urlencode 'statement=use experiments;
start feed TweetFeed;
' http://127.0.0.1:19002/query/service > errors.log
