# ===============================
# Dockerfile: Internet OS
# All rights reserved © 2025 Kn3ghtfall
# ===============================

FROM kasmweb/chrome:1.17.0

USER root
WORKDIR /home/kasm-user

RUN apt-get update && apt-get install -y curl unzip && \
    curl https://rclone.org/install.sh | bash && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /home/kasm-user/entrypoint.sh
RUN chmod +x /home/kasm-user/entrypoint.sh

USER kasm-user
WORKDIR /home/kasm-user

EXPOSE 6901
ENTRYPOINT ["/home/kasm-user/entrypoint.sh"]
CMD ["/usr/bin/kasm-launch"]