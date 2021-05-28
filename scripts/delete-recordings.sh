#!/bin/bash
#
S3_BUCKET="playback-dev.savvyreading.com"
S3_PRESENTATION="presentation"
chk=$(/home/ubuntu/scale/s3ls.sh $S3_BUCKET/$S3_PRESENTATION/$1)
#echo ${#chk}
if [ ${#chk} -ne "0" ]; then
    echo "recording $1 removed";
    sudo rm -r /var/bigbluebutton/published/presentation/$1
    exit;
fi