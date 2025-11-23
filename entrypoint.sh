#!/bin/bash

mkdir -p /home/kasm-user/chromium-profile

rclone sync b2:Internet-OS/chrome-profile /home/kasm-user/chromium-profile

Xvfb :0 -screen 0 1920x1080x24 &
fluxbox &
sleep 2
export DISPLAY=:0
x11vnc -display :0 -forever -nopw -shared &
/usr/bin/novnc --vnc localhost:5900 --listen 6080 &

chromium --no-sandbox --user-data-dir=/home/kasm-user/chromium-profile &

while true; do
    sleep 60
    rclone sync /home/kasm-user/chromium-profile b2:Internet-OS/chrome-profile
done