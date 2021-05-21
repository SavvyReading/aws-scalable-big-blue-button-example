#!/bin/bash
#
cd /home/ubuntu/scale
S3_BUCKET="playback-dev.savvyreading.com"
S3_PRESENTATION="presentation"
echo "Upload to S3 $1"
aws s3 cp --recursive /var/bigbluebutton/published/presentation/$1  s3://$S3_BUCKET/$S3_PRESENTATION/$1