#!/bin/sh
SERVER_CONFIG="serverconfig.txt"
INIT_DIR="init"
WORLD_DIR="Worlds"
CLI_ARGS=""

#PLAYER_COUNT -maxplayers
#SERVER_PORT -port
#SERVER_PASS -pass
#WORLD_FILE -world
#AUTOCREATE_SIZE -autocreate
#BAN_LIST -banlist
#WORLD_NAME -worldname
#SECURE -secure

if [ ! -d "${WORLD_DIR}" ]; then
  mkdir "${WORLD_DIR}"
fi

if [ -d "${INIT_DIR}" ]; then
  cp ${INIT_DIR}/${SERVER_CONFIG} ${SERVER_CONFIG}
fi

# func $1 $2 if ! -z $1, append $2$1 to a var
if [ ! -z "${PLAYER_COUNT}" ]; then
  CLI_ARGS="${CLI_ARGS} -maxplayers ${PLAYER_COUNT}"
fi
if [ ! -z "${SERVER_PORT}" ]; then
  CLI_ARGS="${CLI_ARGS} -port ${SERVER_PORT}"
fi
if [ ! -z "${SERVER_PASS}" ]; then
  CLI_ARGS="${CLI_ARGS} -pass ${SERVER_PASS}"
fi
if [ ! -z "${WORLD_FILE}" ]; then
  CLI_ARGS="${CLI_ARGS} -world ${WORLD_DIR}/${WORLD_FILE}"
fi
if [ ! -z "${AUTOCREATE_SIZE}" ]; then
  CLI_ARGS="${CLI_ARGS} -maxplayers ${AUTOCREATE_SIZE}"
fi
if [ ! -z "${BAN_LIST}" ]; then
  CLI_ARGS="${CLI_ARGS} -banlist ${BAN_LIST}"
fi
if [ ! -z "${WORLD_NAME}" ]; then
  CLI_ARGS="${CLI_ARGS} -worldname ${WORLD_NAME}"
fi
if [ ! -z "${SECURE}" ]; then
  CLI_ARGS="${CLI_ARGS} -secure"
fi

./TerrariaServer.bin.x86_64 -config ${SERVER_CONFIG} ${CLI_ARGS}
#./TerrariaServer.bin.x86_64 -config serverconfig.txt
