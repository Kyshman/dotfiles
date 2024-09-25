#!/bin/bash

SOCKET_PATH="$HOME/.local/share/atuin/atuin.sock"

# Remove the socket file if it exists
if [ -S "$SOCKET_PATH" ]; then
echo "Removing socket: $SOCKET_PATH"
rm -f "$SOCKET_PATH"
fi
