#!/bin/bash

SOCKET_PATH="$HOME/.local/share/atuin/atuin.sock"
PID_PATH="$HOME/.local/share/atuin/atuin.pid"

# Check if the socket file exists and remove it
if [ -S "$SOCKET_PATH" ]; then
echo "Removing existing socket: $SOCKET_PATH"
rm -f "$SOCKET_PATH"
fi

# Check if the PID file exists and remove it
if [ -f "$PID_PATH" ]; then
echo "Removing existing PID file: $PID_PATH"
rm -f "$PID_PATH"
fi
