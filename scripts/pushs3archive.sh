#!/bin/bash
#
cd /home/ubuntu/scale

S3_BUCKET="playback-dev.savvyreading.com"
S3_ARCHIVE="archive"
echo "Upload Archive to S3 $1"
aws s3 cp --recursive /var/bigbluebutton/recording/raw/$1  s3://$S3_BUCKET/$S3_ARCHIVE/$1 >>/var/log/bigbluebutton/post_archive.log