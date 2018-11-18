FROM registry.hub.docker.com/library/centos:7 as build
# 1.13.1 jar
ARG SERVER_JAR_URL=https://launcher.mojang.com/v1/objects/fe123682e9cb30031eae351764f653500b7396c9/server.jar
ARG SERVER_JAR=server.jar
WORKDIR /build
COPY resources/ /build
# Download and Unpack the Bedrock Server
RUN yum -y install curl
RUN curl ${SERVER_JAR_URL} --output ${SERVER_JAR}

FROM registry.hub.docker.com/library/openjdk:8u171-alpine3.8 as app
WORKDIR /app
COPY --from=build /build/* /app/
EXPOSE 25565 25575
ENTRYPOINT [ "entrypoint.sh" ]
