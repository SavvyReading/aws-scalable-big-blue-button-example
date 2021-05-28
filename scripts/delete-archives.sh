#!/bin/bash
#
S3_BUCKET="playback-dev.savvyreading.com"
S3_ARCHIVE="archive"
chk=$(/home/ubuntu/scale/s3ls.sh $S3_BUCKET/$S3_ARCHIVE/$1)
#echo ${#chk}
if [ ${#chk} -ne "0" ]; then
    echo "archive $1 removed";
    sudo rm -r /var/bigbluebutton/recording/raw/$1
    exit;
fi
