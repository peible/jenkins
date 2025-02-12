#!/bin/bash
set -e  # Exit on error

source ~/code/jenkins/.env || { echo "Error: .env file missing"; exit 1; }

echo "TOKEN: ${TELEGRAM_BOT_TOKEN:0:5}********"
echo "CHAT_ID: ${CHAT_ID}"
echo "NEW COMMIT: $1"

curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
    -d "chat_id=${CHAT_ID}" \
    -d "text=$1" || { echo "Error sending message"; exit 1; }
