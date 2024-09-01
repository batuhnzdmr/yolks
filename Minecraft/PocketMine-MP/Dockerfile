## Docker Hub
FROM --platform=$TARGETOS/$TARGETARCH ubuntu:22.04

## Configure
LABEL author="Hostibu" maintainer="destek@hostibu.com"
ENV DEBIAN_FRONTEND noninteractive

## User
RUN useradd -m -d /home/hostibu -s /bin/bash hostibu

## Update and upgrade packages
RUN apt update
RUN apt upgrade -y

## Install packages
RUN apt install -y wget tar zip unzip

## Workdir
WORKDIR /home/hostibu

## Run commands
COPY  ./run.sh /run.sh
CMD   [ "/bin/bash", "/run.sh" ]
