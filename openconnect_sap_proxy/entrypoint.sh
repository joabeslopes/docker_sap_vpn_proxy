#!/bin/sh
socat TCP-LISTEN:3201,fork,reuseaddr TCP:$SAP_IP_DEV:32$SAP_NI_DEV &
socat TCP-LISTEN:3202,fork,reuseaddr TCP:$SAP_IP_QAS:32$SAP_NI_QAS &
socat TCP-LISTEN:3203,fork,reuseaddr TCP:$SAP_IP_PRD:32$SAP_NI_PRD &

socat TCP-LISTEN:3301,fork,reuseaddr TCP:$SAP_IP_DEV:33$SAP_NI_DEV &
socat TCP-LISTEN:3302,fork,reuseaddr TCP:$SAP_IP_QAS:33$SAP_NI_QAS &
socat TCP-LISTEN:3303,fork,reuseaddr TCP:$SAP_IP_PRD:33$SAP_NI_PRD &

# Proxy SOCK5 Deno
#echo "$VPN_PASSWORD" | openconnect --protocol=fortinet --servercert "$VPN_CERT_SHA" --user="$VPN_USER" --passwd-on-stdin --script-tun --script="ocproxy -D 1080 -g" "$VPN_GATEWAY"

# Proxy TCP SAP
echo "$VPN_PASSWORD" | openconnect --protocol=fortinet --servercert "$VPN_CERT_SHA" --user="$VPN_USER" --passwd-on-stdin --script="/usr/share/vpnc-scripts/vpnc-script" "$VPN_GATEWAY"
