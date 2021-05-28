#!/bin/bash
#
#verifys objects are in s3, and removes from server.
cd /home/ubuntu/scale
ls /var/bigbluebutton/events -1a | grep - | sed 's|^|/home/ubuntu/scale/delete-events.sh |' |/bin/bash
ls /var/bigbluebutton/published/presentation -1a | grep - | sed 's|^|/home/ubuntu/scale/delete-recordings.sh |' |/bin/bash
ls /var/bigbluebutton/recording/raw -1a | grep - | sed 's|^|/home/ubuntu/scale/delete-archives.sh |' |/bin/bash