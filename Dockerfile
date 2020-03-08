# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support) with Python 3.8
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        openjdk:11-slim

LABEL       author="Nils Gereke" maintainer="mail@wuffy.eu"

RUN 		apt-get update -y \
			&& apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
			&& apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
			libsqlite3-dev wget llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
			libffi-dev liblzma-dev libgdbm-dev uuid-dev python3-openssl \
			&& useradd -d /home/container -m container
 
RUN			curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
RUN			CONFIGURE_OPTS=--enable-optimizations pyenv install 3.8.1 -v
RUN			pyenv global 3.8.1

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]