# Download Application Binary
FROM registry.hub.docker.com/library/centos:7.6.1810 as build
WORKDIR /app
RUN yum -y install \ 
  unzip \
  curl
ARG ZIP_BASE=http://terraria.org/server/terraria-server
ARG SERVER_VER=1353
ARG SERVER_ZIP=server.zip
RUN curl ${ZIP_BASE}-${SERVER_VER}.zip --output ${SERVER_ZIP} && unzip ${SERVER_ZIP} \
  && rm ${SERVER_ZIP} && rm -rf ${SERVER_VER}/{Mac,Windows}/ \
  #&& rm -rf ${SERVER_VER}/Linux/*.{exe,bat} \ 
  && chmod +x ${SERVER_VER}/Linux/TerrariaServer.bin.x86_64 \
  && mv ${SERVER_VER}/Linux server

# Normally, an Alpine base image would be used, but I'm having trouble
# understanding what's going on in ${SERVER_VER}/Linux/.
# One of the things that really confuses me is that .dll and .exe are needed to
# run the program. PRs would be appreciated on this issue.

#FROM registry.hub.docker.com/library/alpine:3.8 as app
FROM registry.hub.docker.com/library/centos:7.6.1810 as app
WORKDIR /app/server
COPY --from=build /app/server/ /app/server/
COPY resources/ .
#ENV LD_LIBARY_PATH=lib64/:${LD_LIBRARY_PATH}
#ENV LD_LIBARY_PATH=.

EXPOSE 7777/tcp 
#CMD ["/bin/sh"]
ENTRYPOINT [ "./entrypoint.sh" ]
