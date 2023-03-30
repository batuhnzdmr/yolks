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
    sh ./update.sh
fi

# Startup message
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu başlatılıyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Run the server
eval ${STARTUP}
