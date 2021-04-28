## Setup Turn Server

## Setup of BBB 2.2 on main Server  
1. `sudo -i`
2. `wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -v xenial-22 -s lms.savvyreading.com -e jeremy.parra@savvyreading.com -g -c turn.savvyreading.com: <turn_secret>`

### Changes made `/usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml`
copyright: "©2021 Savvy Education Inc."

```
- id: standard
  name: Standard
  default: true
  bitrate: 100
- id: medium
  name: Medium
  default: true
  bitrate: 200
  hidden: true
- id: high
  name: High
  default: false
  bitrate: 500
  hidden: true
- id: hd
  name: High definition
  default: false
  bitrate: 800
  hidden: true
```
```
thickness:
# - value: 14
# - value: 12
# - value: 10
# - value: 8
# - value: 6
```

           
```
multiUserTools:
- text
- line
- ellipse
# - triangle
# - rectangle
- pencil
# - hand
```

### Changes made `/usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties`
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

### Changes made `/usr/local/bigbluebutton/core/scripts/presentation.yml`
```
video_formats:
  #- webm
  - mp4
```

### `/usr/share/bbb-web/WEB-INF/classes/spring/turn-stun-servers.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">

    <bean id="stun0" class="org.bigbluebutton.web.services.turn.StunServer">
        <constructor-arg index="0" value="stun:turn1.savvyreading.com"/>
    </bean>
    <bean id="stun1" class="org.bigbluebutton.web.services.turn.StunServer">
        <constructor-arg index="0" value="stun:turn2.savvyreading.com"/>
    </bean>


    <bean id="turn0" class="org.bigbluebutton.web.services.turn.TurnServer">
        <constructor-arg index="0" value="uwj5m68fdrlr8bj3"/>
        <constructor-arg index="1" value="turns:turn1.savvyreading.com:443?transport=tcp"/>
        <constructor-arg index="2" value="86400"/>
    </bean>

    <bean id="turn1" class="org.bigbluebutton.web.services.turn.TurnServer">
        <constructor-arg index="0" value="uwj5m68fdrlr8bj3"/>
        <constructor-arg index="1" value="turn:turn1.savvyreading.com:443?transport=tcp"/>
        <constructor-arg index="2" value="86400"/>
    </bean>

    <bean id="turn2" class="org.bigbluebutton.web.services.turn.TurnServer">
        <constructor-arg index="0" value="uwj5m68fdrlr8bj3"/>
        <constructor-arg index="1" value="turns:turn2.savvyreading.com:443?transport=tcp"/>
        <constructor-arg index="2" value="86400"/>
    </bean>

    <bean id="turn3" class="org.bigbluebutton.web.services.turn.TurnServer">
        <constructor-arg index="0" value="uwj5m68fdrlr8bj3"/>
        <constructor-arg index="1" value="turn:turn2.savvyreading.com:443?transport=tcp"/>
        <constructor-arg index="2" value="86400"/>
    </bean>






    <bean id="stunTurnService"
          class="org.bigbluebutton.web.services.turn.StunTurnService">
        <property name="stunServers">
            <set>
                <ref bean="stun0"/>
                <ref bean="stun1"/>
            </set>
        </property>
        <property name="turnServers">
            <set>
                <ref bean="turn0"/>
                <ref bean="turn2"/>
                <ref bean="turn1"/>
                <ref bean="turn3"/>
            </set>
        </property>
    </bean>
</beans>

```

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
