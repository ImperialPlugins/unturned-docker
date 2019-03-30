FROM ubuntu:18.04
LABEL maintainer="Enes Sadık Özbek <es.ozbek.me>"
ENV DEBIAN_FRONTEND noninteractive
ENV GAME_INSTALL_DIR /home/steam/Unturned
ENV GAME_ID 304930

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
    apt-get install -y unzip tar curl coreutils lib32gcc1 wget libgdiplus gnupg ca-certificates && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install mono-devel && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER steam
WORKDIR /opt/steamcmd
ENTRYPOINT ["./init.sh"]
