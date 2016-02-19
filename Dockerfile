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

EXPOSE 27015 27015
EXPOSE 27039 27039

EXPOSE 1200/udp 1200/udp
EXPOSE 27000/udp 27000/udp
EXPOSE 27015/udp 27015/udp
