#!/bin/bash
cd /hostibu/server

# Check for updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

rm Pocketmine-MP.phar
rm pocketmine.yml

# Check server version
if [[ "${SERVER_VERSION}" == "latest" ]]; then
    wget -q "https://update.pmmp.io/api" -O pocketmine
    link=$(grep -i 'download_url' pocketmine | cut -d '"' -f 4)
    rm api
else
    link="https://github.com/pmmp/PocketMine-MP/releases/download/${SERVER_VERSION}/PocketMine-MP.phar"
fi

# Download server file
wget -q $link -O "PocketMine-MP.phar"

# File permissions
chmod +x PocketMine-MP.phar

# Startup message
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu başlatılıyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Run the server
eval ${STARTUP}
