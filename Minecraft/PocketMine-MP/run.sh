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
    update_server()
    {
        rm Pocketmine-MP.phar
        rm pocketmine.yml

        download_pmmp()
        {
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
        }
        download_pmmp
    }

    file_permission()
    {
        chmod +x bin/php7/bin/php
        chmod +x PocketMine-MP.phar
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
