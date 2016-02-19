FROM phusion/baseimage:latest

MAINTAINER Thanad Pansing <thanad@gmail.com>

RUN apt-get update
RUN apt-get install -y git-core lib32gcc1 screen wget
RUN \
mkdir /cs16 && \
cd /cs16 && \
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
tar -xvzf steamcmd_linux.tar.gz && \
rm steamcmd_linux.tar.gz

WORKDIR "/cs16"

COPY install_cs.txt install_cs.txt

RUN \
while [ ! -d ~/Steam/steamapps/common/Half-Life/cstrike ]; do ./steamcmd.sh +runscript install_cs.txt;sleep 1; done

WORKDIR "~/Steam/steamapps/common/Half-Life"

CMD ["./hlds_run" , "+sv_lan 1" , "-nomaster" , "-game cstrike" , "+maxplayers 30","+map de_dust2"]

EXPOSE 27015
