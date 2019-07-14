FROM registry.hub.docker.com/library/debian as build

WORKDIR /opt/build
RUN apt-get update -y && apt-get install -y \
  curl \
  unzip \
  xz-utils
RUN curl -LO https://www.factorio.com/get-download/0.17.36/headless/linux64
RUN tar -xJf linux64

FROM registry.hub.docker.com/library/debian as app
COPY --from=build /opt/build/factorio /opt/factorio
WORKDIR /opt/factorio
COPY entrypoint.sh .
RUN useradd factorio && chown -R factorio:factorio /opt/factorio
EXPOSE 34197/udp

ENTRYPOINT ["/opt/factorio/entrypoint.sh"]
