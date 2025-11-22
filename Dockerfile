# ===============================
# Dockerfile: Internet OS
# All rights reserved © 2025 Kn3ghtfall
# ===============================

FROM kasmweb/chrome:1.17.0

USER root
WORKDIR /home/kasm-user
RUN apt-get update && \
    apt-get install -y curl unzip fuse && \
    curl https://rclone.org/install.sh | bash && \
    rm -rf /var/lib/apt/lists/*
USER kasm-user

COPY --chmod=755 entrypoint.sh /home/kasm-user/entrypoint.sh
EXPOSE 6901
ENTRYPOINT ["/home/kasm-user/entrypoint.sh"]
