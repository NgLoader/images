# ----------------------------------
# Pterodactyl ArchiSteamFarm Dockerfile
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM        mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim
LABEL       author="NgLoader" maintainer="mail@wuffy.eu"

ARG         ASF_ARCH=x64
ENV         CONFIGURATION Release
ENV         DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV         DOTNET_SKIP_FIRST_TIME_EXPERIENCE 1
ENV         DOTNET_BUNDLE_EXTRACT_BASE_DIR /home/container/.tmp
ENV         NET_CORE_VERSION netcoreapp3.1

RUN	    apt update -y
RUN         apt install -y libcurl4 libicu-dev libkrb5-3 liblttng-ust0 libssl1.1 zlib1g iproute2 git
RUN         useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]