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
CMD ["./steamcmd.sh"]

#Steam Client
EXPOSE 27000-27015/UDP #inclusive (Game client traffic) 
EXPOSE 27015-27030/UDP #inclusive (Typically Matchmaking and HLTV) 
EXPOSE 27014-27050/TCP #inclusive (Steam downloads) 
EXPOSE 4380/UDP

#Dedicated or Listen Servers
EXPOSE 27015/TCP (SRCDS Rcon port) 

#Steamworks P2P Networking and Steam Voice Chat
EXPOSE  3478/UDP
EXPOSE  4379/UDP
EXPOSE  4380/UDP

