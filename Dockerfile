# ===============================
# Dockerfile: Internet OS
# All rights reserved © 2025 Kn3ghtfall
# ===============================

# Base image
FROM kasmweb/chrome:1.17.0

# Set working directory
WORKDIR /home/kasm-user

# Install dependencies and rclone
RUN apt-get update && \
    apt-get install -y curl unzip fuse && \
    curl https://rclone.org/install.sh | bash && \
    rm -rf /var/lib/apt/lists/*

# Copy entrypoint with executable permissions
COPY --chmod=755 entrypoint.sh /home/kasm-user/entrypoint.sh

# Expose port
EXPOSE 6901

# Set entrypoint
ENTRYPOINT ["/home/kasm-user/entrypoint.sh"]
