## Docker Hub
FROM --platform=$TARGETOS/$TARGETARCH ubuntu:22.04

LABEL author="androcyber" maintainer="destek@hostibu.com"

ENV DEBIAN_FRONTEND noninteractive

## User
RUN useradd -m -d /home/container -s /bin/bash container

## Update and upgrade packages
RUN apt update
RUN apt upgrade -y

## Install packages
RUN apt install -y wget tar zip unzip

## configure locale
RUN update-locale lang=en_US.UTF-8 dpkg-reconfigure --frontend noninteractive locales

## Workdir
WORKDIR /home/container

## Run commands
COPY  ./run.sh /run.sh
CMD   [ "/bin/bash", "/entrypoint.sh" ]
