#!/bin/bash
cd /home/container

# Check updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Variables
current_version=$(jq -r ".current_version" hostibu.json)
server_version=$(jq -r ".server_version" hostibu.json)

echo "current : $current_version"
echo "server : $server_version"

# Up to date
if [[ $current_version === $server_version ]]; then
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu | Sunucunuz güncel!"
    echo "-------------------------------------------------------------------------------------------------------------"
# Updates available
else
    update_server()
    {
        # Update server version in hostibu server version api
        jq ".current_version" = ".${SERVER_VERSION}" hostibu.json

        # Hostibu server version api
        wget -q "https://files.hostibu.com/pterodactyl/nests/minecraft-bedrock-edition/bedrock-server/api.json" -O api.json

        # Get server files from hostibu server version api
        link=$(jq -r ".${SERVER_VERSION}" api.json)

        # Download server files
        wget -q $link -O "server.zip"

        # Extract server files
        unzip -qo server.zip

        # Remove old files
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
