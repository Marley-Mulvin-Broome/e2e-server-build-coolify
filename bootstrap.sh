#!/bin/bash
set -e

cd /server

# If server not yet initialized (no start script), set it up
if [ ! -f "start-server.sh" ]; then
  echo "🔽 No server files found, downloading Enigmatica 2 Expert Extended..."
  curl -L -o server.zip https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases/download/v1.65.1/E2E-Extended-v1.65.1-server.zip
  unzip server.zip
  rm server.zip
  chmod +x start-server.sh
  echo "eula=true" > eula.txt
fi

# Launch the server
echo "🚀 Starting Minecraft server..."
exec bash ./start-server.sh
