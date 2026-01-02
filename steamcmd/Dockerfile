# SteamCMD Base Container
# This container provides a base Ubuntu 26.04 environment with SteamCMD installed
# Designed for interactive use and as a base for game server containers

# Note - using trixie-slim versus ubuntu for a ~38% size reduction
FROM debian:trixie-slim@sha256:4bcb9db66237237d03b55b969271728dd3d955eaaa254b9db8a3db94550b1885

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Add i386 architecture support (required for SteamCMD)
RUN dpkg --add-architecture i386

# Install dependencies
# - lib32gcc-s1, lib32stdc++6: 32-bit runtime libraries for SteamCMD
# - ca-certificates, curl: For downloading SteamCMD
# - locales: resolves locale issues
# - software-properties-common: For managing repositories
# TODO - figure out if software-properties-common is needed from ubuntu image

RUN apt-get update && apt-get install -y \
    lib32gcc-s1 \
    lib32stdc++6 \
    ca-certificates \
    curl \
    tar \
    locales

# See https://stackoverflow.com/questions/66859800/
RUN locale-gen en_US.UTF-8

# Clean apt after installs
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create steam user with home directory
# Let the system assign an available UID automatically
RUN useradd -m -s /bin/bash steam

# Switch to steam user
USER steam
WORKDIR /home/steam

# Download and install SteamCMD w/ QoL symlink
# Following the official guide: https://developer.valvesoftware.com/wiki/SteamCMD
RUN mkdir -p /home/steam/steamcmd && \
    cd /home/steam/steamcmd && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
    ln -s /home/steam/steamcmd/steamcmd.sh /home/steam/steamcmd/steamcmd

# Add steamcmd to PATH for convenience
ENV PATH="/home/steam/steamcmd:${PATH}"

# Default to bash shell for interactive use
CMD ["/bin/bash"]
