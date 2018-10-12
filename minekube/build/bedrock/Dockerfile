FROM registry.hub.docker.com/library/debian:stretch-slim
WORKDIR /app
# Install Required Packages for Bedrock Server
ARG SPC_VER="0.96.20.2-1"
ARG LIBCURL_VER="7.52.1-5+deb9u7"
ARG LIBCXX_VER="6.3.0-18+deb9u1"
ARG LIBC_VER="2.24-11+deb9u3"
ARG CURL_VER="7.52.1-5+deb9u7"
ARG UNZIP_VER="6.0-21"
RUN apt-get update -y && apt-get install -y \
  curl=${CURL_VER} \
  unzip=${UNZIP_VER} \
  software-properties-common=${SPC_VER} \
  libcurl3=${LIBCURL_VER} \
  libstdc++6=${LIBCXX_VER} \
  libc6-dev=${LIBC_VER}
## Install backported libssl1.0.0
ARG JESSIE_SSL_100_VER="1.0.1t-1+deb8u8"
RUN add-apt-repository 'deb http://ftp.debian.org/debian/ jessie main' && \
  apt-get update -y && \ 
  apt-get -t jessie install libssl1.0.0=${JESSIE_SSL_100_VER} -y

# Download Bedrock Edition Server
ARG SERVER_ZIPJAR_URL=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.6.1.0.zip
ARG SERVER_ZIP=server.zip
RUN curl ${SERVER_ZIPJAR_URL} --output ${SERVER_ZIP} && unzip ${SERVER_ZIP} && rm ${SERVER_ZIP}

# Package Clean-Up
RUN apt-get -y remove \
  software-properties-common \
  curl \
  && apt-get -y autoremove

# Final Clean-Up
RUN rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH="."
# Shoutout to jmainguy for helping me determine application behaviour
EXPOSE 19132/udp
EXPOSE 19133/udp
ENTRYPOINT [ "./bedrock_server" ]
