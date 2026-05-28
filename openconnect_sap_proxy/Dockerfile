FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    openconnect \
    ocproxy \
    ca-certificates \
    socat \
    vpnc-scripts \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
