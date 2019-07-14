# Shoutout to jmainguy for helping me determine application behaviour
FROM registry.hub.docker.com/library/ubuntu:18.04
WORKDIR /app
COPY entrypoint.sh /app/

# Install Required Packages for Bedrock Server
RUN apt-get update -y && apt-get install -y \
  curl \
  unzip \
  libstdc++6 \
  libc6

# Download Bedrock Edition Server
ARG SERVER_ZIP_URL=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.11.0.23.zip
ARG SERVER_ZIP=server.zip
RUN curl ${SERVER_ZIP_URL} --output ${SERVER_ZIP} && unzip ${SERVER_ZIP} && rm ${SERVER_ZIP}

# Package Clean-Up
# Oh, how my Dockerfile has regressed
RUN apt-get -y remove\
  curl \
  unzip

ENV LD_LIBRARY_PATH="."
EXPOSE 19132/udp 19133/udp
ENTRYPOINT [ "./entrypoint.sh" ]
