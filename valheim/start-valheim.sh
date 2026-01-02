#!/bin/bash
set -e

# Valheim Dedicated Server Startup Script
# This script launches the Valheim server with environment-based configuration

# Default values (can be overridden by environment variables)
SERVER_NAME="${SERVER_NAME:-Valheim Server}"
WORLD_NAME="${WORLD_NAME:-Dedicated}"
SERVER_PASSWORD="${SERVER_PASSWORD:-secret}"
SERVER_PUBLIC="${SERVER_PUBLIC:-0}"
SERVER_PORT="${SERVER_PORT:-2456}"

# Data directory for worlds and configs
DATA_DIR="/home/steam/valheim-data"

# Ensure data directory exists
mkdir -p "$DATA_DIR"

echo "Starting Valheim Dedicated Server..."
echo "Server Name: $SERVER_NAME"
echo "World Name: $WORLD_NAME"
echo "Public Server: $SERVER_PUBLIC"
echo "Port: $SERVER_PORT"
echo "Data Directory: $DATA_DIR"

# TODO - Always hydrate server on run. May take ~2GB on first run within volume

# Launch the server
# -nographics: Run without graphics (headless mode)
# -batchmode: Run in batch mode (non-interactive)
# -name: Server name shown in server browser
# -port: Network port for the server
# -world: World/save name
# -password: Server password
# -public: Whether to list in public server browser (0 or 1)
# -savedir: Directory to store world saves
exec ./valheim_server.x86_64 \
    -nographics \
    -batchmode \
    -name "$SERVER_NAME" \
    -port "$SERVER_PORT" \
    -world "$WORLD_NAME" \
    -password "$SERVER_PASSWORD" \
    -public "$SERVER_PUBLIC" \
    -savedir "$DATA_DIR" # needs to be mounted and read-write
