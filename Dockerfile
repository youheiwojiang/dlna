FROM sameersbn/ubuntu:14.04.20151213
MAINTAINER sameer@damagehead.com

ENV RYGEL_CACHE_DIR=/root/.cache/rygel \
    RYGEL_VIDEOS_DIR=/videos \
    RYGEL_MUSIC_DIR=/music \
    RYGEL_PICTURES_DIR=/pictures

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv B84401E3 \
 && echo "deb http://ppa.launchpad.net/yg-jensge/gupnp/ubuntu trusty main" >> /etc/apt/sources.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y rygel tumbler gstreamer1.0-plugins-base \
      gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
      gstreamer1.0-plugins-ugly gstreamer1.0-libav \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get install -y \
 	iptables


COPY rygel.conf /root/.config/
EXPOSE 8000/tcp 1900/udp
VOLUME ["${RYGEL_CACHE_DIR}", "${RYGEL_VIDEOS_DIR}", "${RYGEL_MUSIC_DIR}", "${RYGEL_PICTURES_DIR}"]


COPY pic/test1.jpg /pictures/test1.jpg
COPY pic/test2.jpg /pictures/test2.jpg
COPY music/lazysong.mp3 /music/lazysong.mp3
COPY chute/run.sh  /usr/local/bin/run.sh

CMD ["bash", "usr/local/bin/run.sh" ]
