#!/bin/bash
cd /home/container

# Check updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Variables
current_version="$(grep -i 'current_version' hostibu | cut -d '"' -f 4)"
server_version="$(grep -i 'server_version' hostibu | cut -d '"' -f 4)"

# Up to date
if [[ "$current_version" == "$server_version" ]]; then
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu | Sunucunuz güncel!"
    echo "-------------------------------------------------------------------------------------------------------------"
# Updates available
else
    update_server()
    {
        # Get hostibu server api
        wget -q "https://files.hostibu.com/pterodactyl/nests/minecraft-bedrock-edition/bedrock-server/api.json" -O api.json
        link=$(grep -i "${SERVER_VERSION}" api.json | cut -d '"' -f 4)

        # Download server files
        wget -q "$link" -O "server.zip"
        unzip -qo server.zip
        rm server.zip
        rm api.json
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
