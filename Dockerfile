FROM debian:8.1

RUN apt-get -y update && \ 
    apt-get -y upgrade && \
    apt-get -y install \
        pulseaudio \
        curl \
        less \
        xvfb \
        qt5-default \
        imagemagick


RUN mkdir ts3 && \
    cd ts3 && \
    curl -O http://dl.4players.de/ts/releases/3.0.17/TeamSpeak3-Client-linux_amd64-3.0.17.run && \
    chmod +x TeamSpeak3-Client-linux_amd64-3.0.17.run && \
    yes | ./TeamSpeak3-Client-linux_amd64-3.0.17.run

ADD run .
ADD .ts3client /root/.ts3client

RUN mkdir dbg
VOLUME ["/dbg"]

CMD ["./run"]