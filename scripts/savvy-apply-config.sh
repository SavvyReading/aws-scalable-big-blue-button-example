#!/bin/bash

# Pull in the helper functions for configuring BigBlueButton
source /etc/bigbluebutton/bbb-conf/apply-lib.sh

enableUFWRules
enableMultipleKurentos

echo " - Update config"
yq w -i $HTML5_CONFIG public.app.copyright "©2021 Savvy Education Inc."
yq w -i $HTML5_CONFIG public.app.remainingTimeThreshold 5
yq w -i $HTML5_CONFIG public.app.customHeartbeat true

yq w -i $HTML5_CONFIG public.kurento.skipVideoPreview false

yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==medium).bitrate' 100

yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==low).default' false
yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==medium).default' true
yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==high).default' false
yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==hd).default' false

yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==low).hidden' true
yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==high).hidden' true
yq w -i $HTML5_CONFIG 'public.kurento.cameraProfiles.(id==hd).hidden' true

# delete thickness 14,12,10,8,6
# yq d -i $HTML5_CONFIG public.whiteboard.toolbar.thickness[0]
# yq d -i $HTML5_CONFIG public.whiteboard.toolbar.thickness[0]
# yq d -i $HTML5_CONFIG public.whiteboard.toolbar.thickness[0]
# yq d -i $HTML5_CONFIG public.whiteboard.toolbar.thickness[0]
# yq d -i $HTML5_CONFIG public.whiteboard.toolbar.thickness[0]


yq d -i $HTML5_CONFIG public.whiteboard.toolbar.multiUserTools
yq w -i $HTML5_CONFIG public.whiteboard.toolbar.multiUserTools[+] "text"
yq w -i $HTML5_CONFIG public.whiteboard.toolbar.multiUserTools[+] "line"
yq w -i $HTML5_CONFIG public.whiteboard.toolbar.multiUserTools[+] "ellipse"
yq w -i $HTML5_CONFIG public.whiteboard.toolbar.multiUserTools[+] "pencil"