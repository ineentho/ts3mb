FROM debian:8.2

ADD https://apt.mopidy.com/mopidy.gpg /tmp/mopidy.gpg
ADD https://apt.mopidy.com/mopidy.list /etc/apt/sources.list.d/mopidy.list

RUN apt-key add /tmp/mopidy.gpg

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
        mopidy \
        mopidy-soundcloud \
        mopidy-spotify \
        gstreamer0.10-alsa \
        python-crypto

ADD https://bootstrap.pypa.io/get-pip.py /tmp/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install -U six
RUN pip install \
    Mopidy-Moped \
    Mopidy-GMusic \
    Mopidy-YouTube \
    Mopidy-MusicBox-Webclient

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD mopidy.conf /root/.config/mopidy/mopidy.conf

VOLUME /var/lib/mopidy/local
VOLUME /var/lib/mopidy/media

WORKDIR /root

RUN mkdir ts3 && \
    cd ts3 && \
    curl -O http://dl.4players.de/ts/releases/3.0.17/TeamSpeak3-Client-linux_amd64-3.0.17.run && \
    chmod +x TeamSpeak3-Client-linux_amd64-3.0.17.run && \
    yes | ./TeamSpeak3-Client-linux_amd64-3.0.17.run

ADD run run
ADD debug debug
ADD setupTeamspeak setupTeamspeak

RUN mkdir dbg
VOLUME ["/dbg"]

CMD ["./run"]


EXPOSE 5900
EXPOSE 6600
EXPOSE 6680
