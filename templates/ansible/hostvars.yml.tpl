---
hostname: ${hostname}
domainname: ${domainname}

wired_iface: ${wired_iface}

wifi_iface: ${wifi_iface}
wifi_address: ${wifi_address}
wifi_country: ${wifi_country}
hotspot_ssid: ${hotspot_ssid}
hotspot_passphrase: ${hotspot_passphrase}

dhcp_start: ${dhcp_start}
dhcp_end: ${dhcp_end}

stubby_upstream_servers:
%{ for upstream in stubby_upstream_servers ~}
- ip_address: ${upstream.ip_address}
  tls_auth_name: ${upstream.tls_auth_name}
%{ endfor ~}

vpn_address: ${vpn_address}
vpn_private_key: ${vpn_private_key}
vpn_endpoint: ${vpn_endpoint}
vpn_endpoint_port: ${vpn_endpoint_port}
vpn_endpoint_public_key: ${vpn_endpoint_public_key}


