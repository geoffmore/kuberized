# SteamCMD Base Container
# This container provides a base Ubuntu 26.04 environment with SteamCMD installed
# Designed for interactive use and as a base for game server containers

FROM ubuntu:26.04@sha256:12aa2ae97b9b295d28962e83cb36cb478f3afbdda68196e5fd62e68bde3a67d5

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Add i386 architecture support (required for SteamCMD)
RUN dpkg --add-architecture i386

# Install dependencies
# - lib32gcc-s1, lib32stdc++6: 32-bit runtime libraries for SteamCMD
# - ca-certificates, curl: For downloading SteamCMD
# - software-properties-common: For managing repositories
RUN apt-get update && apt-get install -y \
    lib32gcc-s1 \
    lib32stdc++6 \
    ca-certificates \
    curl \
    software-properties-common \
    tar

# steamcmd stuff
# https://stackoverflow.com/questions/66859800/
# https://steamcommunity.com/app/221410/discussions/2/6717729343879417224/
#RUN add-apt-repository multiverse && apt-get -y update # steamcmd from multiverse doesn't appear to work

RUN apt-get install -y locales

#RUN apt-get install -y steamcmd

RUN locale-gen en_US.UTF-8

# Clean apt after installs
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create steam user with home directory
# Let the system assign an available UID automatically
RUN useradd -m -s /bin/bash steam

# Switch to steam user
USER steam
WORKDIR /home/steam

# Download and install SteamCMD
# Following the official guide: https://developer.valvesoftware.com/wiki/SteamCMD
RUN mkdir -p /home/steam/steamcmd && \
    cd /home/steam/steamcmd && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# QoL: symlink steamcmd.sh to steamcmd
RUN ln -s /home/steam/steamcmd/steamcmd.sh /home/steam/steamcmd/steamcmd

# Add steamcmd to PATH for convenience
ENV PATH="/home/steam/steamcmd:${PATH}"

# Default to bash shell for interactive use
CMD ["/bin/bash"]
