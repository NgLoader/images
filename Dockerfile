FROM gitlab/gitlab-ee:latest

LABEL author="NgLoader" maintainer="mail@wuffy.eu"

USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ./entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]