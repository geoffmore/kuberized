#!/bin/sh
SERVER_CONFIG="server.properties"
INIT_DIR="init"
if [ -f "${INIT_DIR}/server.properties" ]; then
  cp "${INIT_DIR}/server.properties" ${SERVER_CONFIG}
fi
./bedrock_server    
