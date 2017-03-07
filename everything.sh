#!/bin/sh

./createAsterix.sh
./startFeed.sh "create dataset Tweets1(TweetMessageType) primary key id using compaction policy binomial ( (\"num-components\" =\"6\"));"
