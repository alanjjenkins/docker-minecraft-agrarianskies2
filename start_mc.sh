#!/bin/bash
VAR=$(cat <<'ENDCONFIG'
allow-flight=false
allow-nether=true
announce-player-achievements=true
difficulty=1
enable-command-block=false
enable-query=false
enable-rcon=true
force-gamemode=false
gamemode=0
generate-structures=true
generator-settings=
level-name=world
level-seed=
level-type=DEFAULT
max-build-height=256
max-players=60
motd=Welcome to the Redwood Agrarian Skies 2 Server
online-mode=true
op-permission-level=4
player-idle-timeout=0
pvp=true
rcon.password=pass
rcon.port=25575
resource-pack=
server-ip=
server-port=25565
snooper-enabled=true
spawn-animals=true
spawn-monsters=true
spawn-npcs=true
spawn-protection=0
view-distance=10
white-list=true
ENDCONFIG
)

echo "$VAR" > /srv/minecraft/server.properties

cd /srv/minecraft/ && java -server -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:NewRatio=1 -Xmx8096M -Xms8096M -jar forge-1.7.10-10.13.3.1428-1.7.10-universal.jar nogui
