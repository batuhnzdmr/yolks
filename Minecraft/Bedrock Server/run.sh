#!/bin/bash
#
#       Social Media
#   youtube.com/androcyber
#   twitch.com/androcyber
#   twitter.com/androcyber0
#   instagram.com/androcyber0
#
#   Made by androcyber
#
cd /home/container

# Check for updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Variables
current_version="$(grep -i 'current_version' hostibu | cut -d '"' -f 4)"
server_version="$(grep -i 'server_version' hostibu | cut -d '"' -f 4)"

if [[ "$current_version" == "$server_version" ]]; then
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu | Sunucunuz güncel!"
    echo "-------------------------------------------------------------------------------------------------------------"
else
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu | Sunucunuz güncel değil! Sunucunuz güncelleniyor..."
    echo "-------------------------------------------------------------------------------------------------------------"

    update_server()
    {
        # Get hostibu server api
        wget -q "https://hostibu.com/panel/bedrockserver/api"
        link=$(grep -i "${SERVER_VERSION}" api | cut -d '"' -f 4)

        # Download server files
        wget -q "$link" -O "server.zip"
        unzip -q server.zip -o
        rm server.zip
        rm api
    }

    file_permission()
    {
        chmod +x bedrock_server
    }

    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu - Sunucu güncellemeleri kuruluyor..."
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
