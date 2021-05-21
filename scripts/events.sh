#!/bin/bash
#
cd /home/ubuntu/scale

S3_BUCKET="playback-dev.savvyreading.com"
S3_EVENTS="events"
aws s3 cp --recursive /var/bigbluebutton/events/$1  s3://$S3_BUCKET/$S3_EVENTS/$1 >> /var/log/bigbluebutton/events.log