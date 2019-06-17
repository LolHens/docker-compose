FROM debian:stretch
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV COMPOSE_VERSION 1.24.0


ADD ["https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/cleanimage", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      nano \
      unzip \
 && cleanimage

RUN curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose
