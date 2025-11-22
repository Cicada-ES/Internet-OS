#!/bin/bash

mkdir -p /home/kasm-user/.local/share/kasm-default-profile

rclone mount b2:my-bucket/chrome-profile /home/kasm-user/.local/share/kasm-default-profile \
    --allow-other \
    --uid $(id -u) \
    --gid $(id -g) &

sleep 2

exec /usr/bin/kasm-launch
