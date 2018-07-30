FROM debian:8.2

RUN apt-get -y update && \ 
    apt-get -y upgrade && \
    apt-get -y install \
        libasound2 \
        libasound2-plugins \
        alsa-utils \
        alsa-oss \
        libpulse0 \
        pulseaudio \
        pavucontrol \
        pulseaudio-utils \
        curl \
        less \
        xvfb \
        qt5-default \
        imagemagick \
        x11vnc \
        xdotool \
        iceweasel \
        libnss3

WORKDIR /root

RUN mkdir ts3 && \
    cd ts3 && \
    curl -O http://dl.4players.de/ts/releases/3.1.10/TeamSpeak3-Client-linux_amd64-3.1.10.run && \
    chmod +x TeamSpeak3-Client-linux_amd64-3.1.10.run && \
    yes | ./TeamSpeak3-Client-linux_amd64-3.1.10.run

ADD run run
ADD debug debug
ADD setupTeamspeak setupTeamspeak

RUN mkdir dbg
VOLUME ["/dbg"]

CMD ["./run"]


EXPOSE 5900
