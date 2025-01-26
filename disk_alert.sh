#!/bin/bash

# Set tour chatID
TG_BOT_TOKEN=""
TG_CHAT_ID=""
TG_THREAD_ID=""

#You can add your castom servername here
#SERVER_NAME=""
DISK_MAX=89
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

#You can castomise alert message here
ALERT_MESSAGE="⚠️ WARNING! ⚠️
📈 Low disk space on the server! 💾
🖥 Server: $SERVER_NAME
🔴 USED: $DISK_USAGE%"


send_tg_notify() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendMessage" \
        -d chat_id="${TG_CHAT_ID}" \
        -d message_thread_id="${TG_THREAD_ID}" \
        -d text="${message}" \
        -d parse_mode="HTML"
}

if [ $DISK_USAGE -gt $DISK_MAX ]; then
    send_tg_notify "$ALERT_MESSAGE"
fi
