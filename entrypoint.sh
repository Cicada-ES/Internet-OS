#!/bin/bash
set -e

mkdir -p ~/.config/rclone

cat <<EOF > ~/.config/rclone/rclone.conf
[backblaze]
type = b2
account = ${B2_ACCOUNT_ID}
key = ${B2_APPLICATION_KEY}
endpoint = ${B2_ENDPOINT}
EOF

while true; do
    rclone sync /home/kasm-user/backups backblaze:Internet-OS
    sleep 60
done &

exec /start-kasm.sh