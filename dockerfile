FROM debian:latest
MAINTAINER V1D1AN

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install tcpreplay inotify-tools

RUN apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data

ADD tcpreplay.sh /data

RUN chmod 755 /data/tcpreplay.sh

ENTRYPOINT ["/data/tcpreplay.sh"]
