#!/bin/bash
cd /home/container

# Check for updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

rm Pocketmine-MP.phar

# Check version
if [[ "${SERVER_VERSION}" == "latest" ]]; then
    wget -q "https://update.pmmp.io/api" -O api.json
    link=$(jq -r '.download_url' api.json)
    rm api.json
else
    link="https://github.com/pmmp/PocketMine-MP/releases/download/${SERVER_VERSION}/PocketMine-MP.phar"
fi

# Download server files
wget -q $link -O "PocketMine-MP.phar"

# File permissions
chmod +x bin/php7/bin/php
chmod +x PocketMine-MP.phar

# Startup message
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu başlatılıyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Run the server
eval ${STARTUP}
