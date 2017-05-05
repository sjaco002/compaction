#!/bin/sh

rm nohup.out
rm totals.out
./createAsterix.sh
./startFeed.sh "create dataset Tweets1(TweetMessageType) primary key id using compaction policy MLatencyK ( (\"num-components\" =\"20\"));"
