FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    openvpn \
    ca-certificates \
    socat \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
