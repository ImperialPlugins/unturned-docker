FROM ubuntu:bionic
LABEL maintainer="Enes Sadık Özbek <es.ozbek.me>"
ENV DEBIAN_FRONTEND noninteractive
ENV GAME_INSTALL_DIR /home/steam/Unturned
ENV GAME_ID 1110390
ENV SERVER_NAME server
ENV STEAM_USERNAME anonymous

EXPOSE 27015
EXPOSE 27016

# Add Steam user
RUN adduser \
	--home /home/steam \
	--disabled-password \
	--shell /bin/bash \
	--gecos "user for running steam" \
	--quiet \
	steam

# Create working directory
RUN mkdir -p /opt/steamcmd && \
    cd /opt/steamcmd && \
    chown -R steam /opt/steamcmd

WORKDIR /opt/steamcmd
COPY . .

# Set perms
RUN chmod +x init.sh && \
    chmod +x start_gameserver.sh

# Install required packages
RUN apt-get update && \
    apt-get install -y unzip tar curl coreutils lib32gcc1 wget libgdiplus && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER steam
WORKDIR /opt/steamcmd
ENTRYPOINT ["./init.sh"]
