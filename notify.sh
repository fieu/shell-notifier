#!/usr/bin/env bash

# Set arguments
WEBHOOK_URL="$1"

# Variables
TMPFILE=$(mktemp)
USER_IP=$(echo $SSH_CLIENT | awk '{ print $1}')

# Grab IP information 1 time and cache it
curl -s "http://ip-api.com/json/${USER_IP}" > $TMPFILE

# Execute webhook
discord.sh \
    --webhook-url "$WEBHOOK_URL" \
    --username "ShellBot" \
    --avatar "https://i.imgur.com/iXIShwr.png" \
    --title "Shell Opened" \
    --description "New \`$(basename "$SHELL")\` shell opened.\n\n**Details**\n:small_blue_diamond: Host: \`$(hostname -f)\`\n:small_blue_diamond: User: \`$(whoami)\`\n:small_blue_diamond: TTY: \`${SSH_TTY}\`\n\n**IP Address Information**\n:small_orange_diamond: IP: \`${USER_IP}\`\n:small_orange_diamond: Country: \`$(cat $TMPFILE | jq -r .country)\`\n:small_orange_diamond: City: \`$(cat $TMPFILE | jq -r .city)\`\n:small_orange_diamond: Region: \`$(cat $TMPFILE | jq -r .regionName)\`\n:small_orange_diamond: ISP: \`$(cat $TMPFILE | jq -r .isp)\`"
