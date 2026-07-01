#!/bin/sh
socat TCP-LISTEN:3201,fork,reuseaddr TCP:$SAP_IP_DEV:32$SAP_NI_DEV &
socat TCP-LISTEN:3202,fork,reuseaddr TCP:$SAP_IP_QAS:32$SAP_NI_QAS &
socat TCP-LISTEN:3203,fork,reuseaddr TCP:$SAP_IP_PRD:32$SAP_NI_PRD &

socat TCP-LISTEN:3301,fork,reuseaddr TCP:$SAP_IP_DEV:33$SAP_NI_DEV &
socat TCP-LISTEN:3302,fork,reuseaddr TCP:$SAP_IP_QAS:33$SAP_NI_QAS &
socat TCP-LISTEN:3303,fork,reuseaddr TCP:$SAP_IP_PRD:33$SAP_NI_PRD &

# Proxy TCP SAP

# Inicia o daemon principal (charon) em background
/usr/lib/ipsec/charon &
CHARON_PID=$!

# Aguarda a criação do socket VICI (/var/run/charon.vici)
sleep 2

# Lê e aplica as configurações do swanctl.conf na memória do charon
swanctl --load-all

swanctl --initiate --child my-vpn-child
swanctl --list-conns
swanctl --list-sas

wait $CHARON_PID
