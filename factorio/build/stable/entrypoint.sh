#!/bin/sh

WORLD_FILE="saves/world.zip"
if [ -w $WORLD_FILE ]; then
  echo "World found"
else
  echo "World is being created"
  ./bin/x64/factorio --create $WORLD_FILE
fi
echo "Starting sever"
./bin/x64/factorio --start-server $WORLD_FILE
