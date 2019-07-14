#!/bin/sh
# entrypoint.sh still needs work to play nice with java and kubernetes
JAVA_DEFAULT_OPTS='-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap'
SERVER_CONFIG="server.properties"
INIT_DIR="init"
if [ -f "${INIT_DIR}/server.properties" ]; then
  cp "${INIT_DIR}/server.properties" ${SERVER_CONFIG}
fi
# Some if based on JAVA_OPTS
# Default for no JAVA_OPS
java ${JAVA_DEFAULT_OPS} -jar server.jar nogui
