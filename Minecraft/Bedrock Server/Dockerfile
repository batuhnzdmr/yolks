## Docker Hub
FROM --platform=$TARGETOS/$TARGETARCH ubuntu:18.04

## Configure
LABEL author="androcyber" maintainer="destek@hostibu.com"
ENV DEBIAN_FRONTEND noninteractive

## User
RUN useradd -m -d /home/container -s /bin/bash container

## Update and upgrade packages
RUN apt update
RUN apt upgrade -y

## Install packages
RUN apt install -y wget libcurl4

## Workdir
WORKDIR /home/container

## Run commands
COPY ./run.sh /run.sh
COPY ./update.sh /update.sh
CMD [ "/bin/bash", "/run.sh" ]
