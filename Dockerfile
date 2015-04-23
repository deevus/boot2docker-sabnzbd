FROM ubuntu
MAINTAINER Simon Hartcher "simon@simonhartcher.com"

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:jcfp/ppa
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y sabnzbdplus wget

WORKDIR /tmp
RUN wget http://www.rarlab.com/rar/unrar_5.2.5-0.1_amd64.deb
RUN dpkg -i unrar_5.2.5-0.1_amd64.deb

EXPOSE 9200

VOLUME ["/data"]

CMD ["sabnzbdplus", "-b", "0", "-s", "0.0.0.0:9200", "-f", "/data/sabnzbd.ini"]
