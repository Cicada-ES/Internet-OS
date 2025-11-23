# ===============================
# Dockerfile: Internet OS
# All rights reserved © 2025 Kn3ghtfall
# ===============================

FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget curl unzip sudo supervisor \
                       x11vnc xvfb fluxbox chromium \
                       novnc websockify fuse && \
    curl https://rclone.org/install.sh | bash && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.config/rclone
COPY rclone.conf /root/.config/rclone/rclone.conf

WORKDIR /home/kasm-user

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6080
ENTRYPOINT ["/entrypoint.sh"]