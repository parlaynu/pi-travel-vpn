#!/usr/bin/env bash

iptables -D INPUT -i wg0 -j ACCEPT
iptables -D FORWARD -i {{ wifi_iface }} -o wg0 -j ACCEPT
iptables -D FORWARD -i wg0 -o {{ wifi_iface }} -j ACCEPT

iptables -t nat -D POSTROUTING -o wg0 -j MASQUERADE

