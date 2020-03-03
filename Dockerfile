# ----------------------------------
# Pterodactyl Dockerfile
# ----------------------------------
FROM		gitlab/gitlab-ce

LABEL 		author="Nils Gereke" maintainer="mail@wuffy.eu"

RUN 		apt update -y \
			&& apt install -y iproute2 \
			&& useradd -d /home/container -m container
 
 USER 		container
 ENV  		USER=container HOME=/home/container

WORKDIR		/home/container

COPY		./entrypoint.sh /entrypoint.sh

CMD			["/bin/bash", "/entrypoint.sh"]