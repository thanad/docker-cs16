FROM phusion/baseimage:latest

MAINTAINER Thanad Pansing <thanad@gmail.com>

RUN apt-get update
RUN apt-get install -y git-core lib32gcc1 screen wget
RUN \
mkdir /cs16 && \
cd /cs16 && \
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
tar -xvzf steamcmd_linux.tar.gz && ls -la

WORKDIR "/cs16"

RUN \
./steamcmd.sh +login anonymous +app_update 90 validate +quit && \
./steamcmd.sh +login anonymous +app_update 90 validate +quit

WORKDIR "~/Steam/steamapps/common/Half-Life"

CMD ["./hlds_run -game cstrike -autoupdate +maxplayers 30 +map de_dust2"]

## Steam Client
# inclusive (Game client traffic) 
EXPOSE 27000-27015/udp
# inclusive (Typically Matchmaking and HLTV) 
EXPOSE 27015-27030/udp
# inclusive (Steam downloads) 
EXPOSE 27014-27050/tcp
EXPOSE 4380/udp

## Dedicated or Listen Servers
# (SRCDS Rcon port) 
EXPOSE 27015/tcp

## Steamworks P2P Networking and Steam Voice Chat
EXPOSE  3478/udp
EXPOSE  4379/udp
EXPOSE  4380/udp

