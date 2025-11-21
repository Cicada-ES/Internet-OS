# Internet OS

A cloud-based persistent browser using Kasm Chrome.  
Runs entirely in the cloud, accessible via any web browser, with persistent sessions and logins.

## Features

- Full Chromium browser in the cloud
- Persistent logins and cookies
- VNC password protected
- Works on any hosting service that supports Docker

## Usage

1. **Set Environment Variable**:  
   - `VNC_PASSWORD=YourPassword` for noVNC access

2. **Mount Persistent Volume**:  
   - Mount a persistent folder to `/home/kasm-user/.config/chromium`  
   - Keeps cookies, logins, and tabs across restarts

3. **Start the container**:  
   - Run the Dockerfile to launch the browser

4. **Access**:  
   - Open the container’s public URL → enter VNC password → use browser

## Notes

- No Node.js or additional scripts required
- No frontend modifications needed