#!/bin/sh
socat TCP-LISTEN:3201,fork,reuseaddr TCP:$SAP_IP_DEV:32$SAP_NI_DEV &
socat TCP-LISTEN:3202,fork,reuseaddr TCP:$SAP_IP_QAS:32$SAP_NI_QAS &
socat TCP-LISTEN:3203,fork,reuseaddr TCP:$SAP_IP_PRD:32$SAP_NI_PRD &

socat TCP-LISTEN:3301,fork,reuseaddr TCP:$SAP_IP_DEV:33$SAP_NI_DEV &
socat TCP-LISTEN:3302,fork,reuseaddr TCP:$SAP_IP_QAS:33$SAP_NI_QAS &
socat TCP-LISTEN:3303,fork,reuseaddr TCP:$SAP_IP_PRD:33$SAP_NI_PRD &

# Geração efêmera do arquivo de autenticação
echo "$VPN_USER" > /tmp/vpn_auth.txt
echo "$VPN_PASSWORD" >> /tmp/vpn_auth.txt

# Isolamento de leitura (Mandatório para o binário do OpenVPN não abortar)
chmod 600 /tmp/vpn_auth.txt

# OpenVPN
openvpn --cd /myconf --config $VPN_CONFIG --auth-user-pass /tmp/vpn_auth.txt
