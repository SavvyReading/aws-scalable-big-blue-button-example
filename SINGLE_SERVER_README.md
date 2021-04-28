## Setup Turn Server

## Setup of BBB 2.2 on main Server  
1. `sudo -i`
2. `wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -v xenial-22 -s lms.savvyreading.com -e jeremy.parra@savvyreading.com -g -c turn.savvyreading.com: <turn_secret>`

### Changes made/usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml
1. sed -i.bak '/chat:/,/enabled:/ s/true/false/'  
defaultWelcomeMessage==Welcome to <b>%%CONFNAME%%</b>!<br><br>
defaultWelcomeMessageFooter=<br><br>
clientLogoutTimerInMinutes=20
meetingExpireIfNoUserJoinedInMinutes=20
meetingExpireWhenLastUserLeftInMinutes=5
userInactivityInspectTimerInMinutes=10
allowModsToUnmuteUsers=true
defaultKeepEvents=true
bigbluebutton.web.serverURL=https://conference.session.savvyreading.com.  NOTE: this is specific to setup 
bigbluebutton.web.logoutURL=https://reader.savvyreading.com
lockSettingsDisablePrivateChat=true
lockSettingsDisablePublicChat=true
lockSettingsDisableNote=true

## Setup Greenlight on main Server

## Update Existing Installation 
1. `sudo -i`
3. Get <Secret> 
`bbb-conf --secret`

4. DO NOT run -g (i.e. do not reinstall greenlight) 
`wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -v xenial-22 -s lms.savvyreading.com -e jeremy.parra@savvyreading.com` 
	 
3. `bbb-conf  --setsecret <secret>`
4. `bbb=conf --restart` *

*NOTE - The first time back up can take a while to  complete
