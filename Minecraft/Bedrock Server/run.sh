#!/bin/bash
cd /home/container

# Check updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Hostibu server version api
rm hostibu.json
wget -q "https://files.hostibu.com/pterodactyl/nests/minecraft-bedrock-edition/bedrock-server/hostibu.json" -O hostibu.json

# Variables
current_version=$(jq -r '.current_version' hostibu.json)
server_version=$(jq -r '.server_version' hostibu.json)

# Up to date
if [[ "$current_version" == "$server_version" ]]; then
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu | Sunucunuz güncel!"
    echo "-------------------------------------------------------------------------------------------------------------"
# Updates available
else
    update_server()
    {
        # Get server files from hostibu server version api
        link=$(jq -r ".${SERVER_VERSION}" hostibu.json)

        # Download server files
        wget -q $link -O "server.zip"
        unzip -qo server.zip
        rm server.zip
    }

    file_permission()
    {
        chmod +x bedrock_server
    }

    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu - Sunucu güncel değil! Sunucu güncellemeleri kuruluyor..."
    echo "-------------------------------------------------------------------------------------------------------------"
    update_server

    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu - Son ayarlamalar yapılıyor..."
    echo "-------------------------------------------------------------------------------------------------------------"
    file_permission

    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu - Sunucu kurulumu tamamlandı!"
    echo "-------------------------------------------------------------------------------------------------------------"
fi

# Startup message
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu başlatılıyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Run the server
eval ${STARTUP}
