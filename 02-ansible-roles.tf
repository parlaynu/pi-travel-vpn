locals {
  gateway_role = "gateway"
  iptables_role = "iptables"
  dnsmasq_role = "dnsmasq"
  wireguard_role = "wireguard"
  hotspot_role = "hotspot"
}

resource "template_dir" "gateway" {
  source_dir      = "templates/ansible-roles/${local.gateway_role}"
  destination_dir = "local/ansible/roles/${local.gateway_role}"

  vars = {}
}


resource "template_dir" "iptables" {
  source_dir      = "templates/ansible-roles/${local.iptables_role}"
  destination_dir = "local/ansible/roles/${local.iptables_role}"

  vars = {}
}


resource "template_dir" "dnsmasq" {
  source_dir      = "templates/ansible-roles/${local.dnsmasq_role}"
  destination_dir = "local/ansible/roles/${local.dnsmasq_role}"

  vars = {}
}


resource "template_dir" "wireguard" {
  source_dir      = "templates/ansible-roles/${local.wireguard_role}"
  destination_dir = "local/ansible/roles/${local.wireguard_role}"

  vars = {}
}

resource "template_dir" "hotspot" {
  source_dir      = "templates/ansible-roles/${local.hotspot_role}"
  destination_dir = "local/ansible/roles/${local.hotspot_role}"

  vars = {}
}

