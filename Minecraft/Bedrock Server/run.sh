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
current_version="$(grep -i 'current_version' hostibu | cut -d '"' -f 4)"
if [[ "$current_version" == "${SERVER_VERSION}" ]]; then
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu | Sunucunuz güncel!"
    echo "-------------------------------------------------------------------------------------------------------------"
else
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Hostibu | Sunucunuz güncel değil! Sunucunuz güncelleniyor..."
    echo "-------------------------------------------------------------------------------------------------------------"

    update_server()
    {
        # Workdir
        cd /home/container
        
        # Check server version
        server_version="$(grep -i 'server_version' hostibu | cut -d '"' -f 4)"
        mkdir -p /home/container/yedek
        mv /home/container/* /home/container/yedek

        download_bedrockserver()
        {
            # Check version
            if [[ "$server_version" == "latest" ]]; then
                link="https://www.googleapis.com/drive/v3/files/1gShqlrI8jSg9qLcTkbA4k-FtVNYIU5pE?alt=media&key=AIzaSyCjmiOfzK-fZha_OLYta0KRqq7w4M-Yu90"
            elif [[ "$server_version" == "1.19.63" ]]; then
                link="https://www.googleapis.com/drive/v3/files/1Fyei7iDnU20q9wUELoQ-pDVFP-MQgC4m?alt=media&key=AIzaSyCjmiOfzK-fZha_OLYta0KRqq7w4M-Yu90"
            elif [[ "$server_version" == "1.19.70" ]]; then
                link="https://www.googleapis.com/drive/v3/files/1gShqlrI8jSg9qLcTkbA4k-FtVNYIU5pE?alt=media&key=AIzaSyCjmiOfzK-fZha_OLYta0KRqq7w4M-Yu90"
            fi
        
            # Download server files
            wget -q "$link" -O "server.zip"
            unzip -q server.zip
            rm server.zip
        }

        download_bedrockserver
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
