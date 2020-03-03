# ----------------------------------
# Pterodactyl Dockerfile
# ----------------------------------
FROM		ubuntu:18.10

LABEL 		author="Nils Gereke" maintainer="mail@wuffy.eu"

RUN 		apt update -y \
			&& apt install -y iproute2 curl openssh-server ca-certificates \
			&& apt install -y postfix \
			&& useradd -d /home/container -m container

RUN			curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash

 USER 		container
 ENV  		USER=container HOME=/home/container

WORKDIR		/home/container

COPY		./entrypoint.sh /entrypoint.sh

CMD			["/bin/bash", "/entrypoint.sh"]