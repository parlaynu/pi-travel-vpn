## render the run script

resource "local_file" "run_playbook" {
  content = templatefile("templates/ansible/run-ansible.sh.tpl", {
      inventory_file = "inventory.ini"
    })
  filename = "local/ansible/run-ansible.sh"
  file_permission = "0755"
}


## render the playbook

resource "local_file" "playbook" {
  content = templatefile("templates/ansible/playbook.yml.tpl", {
      gateway_role = local.gateway_role,
      iptables_role = local.iptables_role,
      dnsmasq_role = local.dnsmasq_role,
      wireguard_role = local.wireguard_role,
      hotspot_role = local.hotspot_role
    })
  filename = "local/ansible/playbook.yml"
}


## render host variables

resource "local_file" "hostvars" {

  content = templatefile("templates/ansible/hostvars.yml.tpl", {
    hostname = var.hostname,
    domainname = var.domainname,
    wired_iface = var.wired_iface,
    wifi_iface = var.wifi_iface,
    wifi_address = local.wifi_address,
    wifi_country = var.wifi_country
    hotspot_ssid = var.hotspot_ssid,
    hotspot_passphrase = var.hotspot_passphrase,
    dhcp_start = local.dhcp_start,
    dhcp_end = local.dhcp_end,
    stubby_upstream_servers = var.stubby_upstream_servers,
    vpn_address = var.vpn_address,
    vpn_private_key = var.vpn_private_key,
    vpn_endpoint = var.vpn_endpoint,
    vpn_endpoint_port = var.vpn_endpoint_port,
    vpn_endpoint_public_key = var.vpn_endpoint_public_key
  })

  filename        = "local/ansible/host_vars/${var.hostname}.yml"
  file_permission = "0640"
}


## render the inventory file

resource "local_file" "inventory" {
  content = templatefile("templates/ansible/inventory.ini.tpl", {
    gateway_name = var.hostname,
    })
  filename = "local/ansible/inventory.ini"
  file_permission = "0640"
}

