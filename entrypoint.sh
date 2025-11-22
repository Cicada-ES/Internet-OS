#!/bin/bash
set -e

BROWSER_PROFILE="/home/kasm-user/.local/share/kasm-browser"
mkdir -p $BROWSER_PROFILE

rclone config create b2remote b2 account $B2_ACCOUNT_ID key $B2_APPLICATION_KEY --non-interactive

REMOTE="b2remote:Internet-OS"

rclone sync $REMOTE/ $BROWSER_PROFILE/ --create-empty-src-dirs --fast-list || true

(
  while sleep 60; do
    rclone sync $BROWSER_PROFILE/ $REMOTE/ --fast-list
  done
) &

exec "$@"