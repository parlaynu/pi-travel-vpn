#!/usr/bin/env bash

iptables -I INPUT 1 -i wg0 -j ACCEPT
iptables -I FORWARD 1 -i {{ wifi_iface }} -o wg0 -j ACCEPT
iptables -I FORWARD 2 -i wg0 -o {{ wifi_iface }} -j ACCEPT

iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE

