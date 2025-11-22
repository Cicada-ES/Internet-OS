# ===============================
# Dockerfile: Internet OS
# All rights reserved © 2025 Kn3ghtfall
# ===============================

FROM kasmweb/chrome:1.17.0

USER root
RUN apt-get update \
 && apt-get install -y curl unzip fuse \
 && curl https://rclone.org/install.sh | bash \
 && rm -rf /var/lib/apt/lists/*

USER kasm-user
WORKDIR /home/kasm-user
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6901
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/kasm-launch"]