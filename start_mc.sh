#!/bin/bash
VAR=$(cat <<'ENDCONFIG'
generator-settings=
op-permission-level=4
allow-nether=true
level-name=world
enable-query=false
allow-flight=false
announce-player-achievements=true
server-port=25565
level-type=DEFAULT
enable-rcon=true
rcon.port=25575
rcon.password=pass
level-seed=
force-gamemode=false
server-ip=
max-build-height=256
spawn-npcs=true
white-list=true
spawn-animals=true
snooper-enabled=true
online-mode=true
resource-pack=
pvp=true
difficulty=1
enable-command-block=false
gamemode=0
player-idle-timeout=0
max-players=60
spawn-monsters=true
generate-structures=true
view-distance=10
motd=Welcome to the Redwood Agrarian Skies 2 Server
ENDCONFIG
)

echo "$VAR" > /srv/minecraft/server.properties

cd /srv/minecraft/ && java -server -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:NewRatio=1 -Xmx8096M -Xms8096M -jar forge-1.7.10-10.13.3.1428-1.7.10-universal.jar nogui
