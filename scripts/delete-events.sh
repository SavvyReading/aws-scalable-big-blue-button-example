#!/bin/bash
#
S3_BUCKET="playback-dev.savvyreading.com"
S3_EVENTS="events"
chk=$(/home/ubuntu/scale/s3ls.sh $S3_BUCKET/$S3_EVENTS/$1)
#echo ${#chk}
if [ ${#chk} -ne "0" ]; then
    echo "events $1 removed";
    sudo rm -r /var/bigbluebutton/events/$1
    exit;
fi
