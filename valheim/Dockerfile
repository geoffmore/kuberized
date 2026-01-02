# Valheim Dedicated Server Container
# Builds on the steamcmd-base image to create a ready-to-run Valheim server

FROM steamcmd-base:latest

# Switch to root to install packages
USER root

# Install Valheim-specific dependencies
# - libatomic1: Atomic operations library required by Valheim
# - libpulse-dev, libpulse0: PulseAudio libraries for audio support
RUN apt-get update && apt-get install -y \
    libatomic1 \
    libpulse-dev \
    libpulse0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to steam user for server installation
USER steam
WORKDIR /home/steam

# Create directory for server data (worlds, configs, logs)
RUN mkdir -p /home/steam/valheim-server /home/steam/valheim-data

# TODO - default folder path should be set in this image for CLI usage
# TODO - build should not contain server software. Instead download it on first run to app cache dir
# 'du -sh $HOME' before download: 6.0M; after download: 1.9G. Distributing with the downloaded files would be a nightmare
# Debug
CMD ["/bin/bash"]


# Download Valheim Dedicated Server (App ID: 896660)
# +force_install_dir MUST come before +login
# +login anonymous for public dedicated server files
# +app_update downloads and validates the server files
# full directory path is needed for some reason. This should be a volume
#RUN /home/steam/steamcmd/steamcmd.sh \
#    +force_install_dir /home/steam/valheim-server \
#    +login anonymous \
#    +app_update 896660 validate \
#    +quit
#
## Copy startup script
#COPY --chown=steam:steam start-valheim.sh /home/steam/start-valheim.sh
#RUN chmod +x /home/steam/start-valheim.sh
#
## Set working directory to server installation
#WORKDIR /home/steam/valheim-server
#
## Expose Valheim server ports
## 2456-2457: Game ports (UDP)
## 2458: Query port (UDP) - used for server browser
#
#EXPOSE 2456-2458/udp
## TODO - determine if expose is necessary
## Default environment variables for server configuration
##ENV SERVER_NAME="Valheim Server" \
##    WORLD_NAME="Dedicated" \
##    SERVER_PASSWORD="secret" \
##    SERVER_PUBLIC="0"
#
## Default command starts the server using our startup script
#CMD ["/home/steam/start-valheim.sh"]
