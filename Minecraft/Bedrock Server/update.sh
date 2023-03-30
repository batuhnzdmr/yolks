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

update_packages()
{
    apt update
    apt ugprade -y
    apt install -y wget unzip
    clear
}

update_server()
{
    cd /home/container

    download_bedrockserver()
    {
        # Check version
        if [[ "${SERVER_VERSION}" == "latest" ]]; then
            link="https://www.googleapis.com/drive/v3/files/1gShqlrI8jSg9qLcTkbA4k-FtVNYIU5pE?alt=media&key=AIzaSyCjmiOfzK-fZha_OLYta0KRqq7w4M-Yu90"
        elif [[ "${SERVER_VERSION}" == "1.19.63" ]]; then
            link="https://www.googleapis.com/drive/v3/files/1Fyei7iDnU20q9wUELoQ-pDVFP-MQgC4m?alt=media&key=AIzaSyCjmiOfzK-fZha_OLYta0KRqq7w4M-Yu90"
        elif [[ "${SERVER_VERSION}" == "1.19.70" ]]; then
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
echo "Hostibu - Güncellemeler kuruluyor..."
echo "-------------------------------------------------------------------------------------------------------------"
update_packages
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu - Güncellemeler kuruldu."
echo "-------------------------------------------------------------------------------------------------------------"

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
