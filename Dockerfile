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

COPY install_cs.txt install_cs.txt

RUN \
./steamcmd.sh +runscript install_cs.txt && \
./steamcmd.sh +runscript install_cs.txt

WORKDIR "~/Steam/steamapps/common/Half-Life"

#CMD ["./hlds_run +sv_lan 1 -nomaster -game cstrike -autoupdate +maxplayers 30 +map de_dust2"]

EXPOSE 27015/tcp 27015/tcp
