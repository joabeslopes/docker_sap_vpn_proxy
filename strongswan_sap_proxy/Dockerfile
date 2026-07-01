FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    strongswan \
    strongswan-pki \
    strongswan-swanctl \
    libcharon-extra-plugins \
    ca-certificates \
    socat \
    iptables \
    iproute2 \
    kmod \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
