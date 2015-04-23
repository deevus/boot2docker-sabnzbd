FROM ubuntu
MAINTAINER Simon Hartcher "simon@simonhartcher.com"

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:jcfp/ppa
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y sabnzbdplus unrar-free

EXPOSE 9200

VOLUME ["/data"]

CMD ["sabnzbdplus", "-b", "0", "-s", "0.0.0.0:9200", "-f", "/data/sabnzbd.ini"]
