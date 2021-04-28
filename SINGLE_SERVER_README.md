## Setup Turn Server

## Setup of BBB 2.2 on main Server  
1. `sudo -i`
2. `wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -v xenial-22 -s lms.savvyreading.com -e jeremy.parra@savvyreading.com -g -c turn.savvyreading.com: <turn_secret>`

### Changes made
1. sed -i.bak '/chat:/,/enabled:/ s/true/false/'  /usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml

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
