#!/bin/bash
#
cd /home/container

# Check for updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

rm PocketMine-MP.phar

# Check version
if [[ "${SERVER_VERSION}" == "latest" ]]; then
    wget -q "https://update.pmmp.io/api"
    link=$(grep -i 'download_url' api | cut -d '"' -f 4)
    rm api
else
    link="https://github.com/pmmp/PocketMine-MP/releases/download/${SERVER_VERSION}/PocketMine-MP.phar"
fi

# Download server files
wget -q "$link" -O "PocketMine-MP.phar"
chmod +x bin/php7/bin/php
chmod +x PocketMine-MP.phar

# Startup message
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu başlatılıyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Run the server
eval ${STARTUP}
