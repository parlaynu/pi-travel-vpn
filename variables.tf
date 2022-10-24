variable "hostname" {
  default = "pigment"
}

variable "domainname" {
  default = "travel.example.xyx"
}

variable "ssh_username" {
  default = "pi"
}

variable "ssh_key_file" {
  default = "~/.ssh/rpi"
}

variable "wifi_iface" {
  default = "wlan0"
}

variable "wifi_country" {
  default = ""
}

variable "hotspot_ssid" {
  default = ""
}

variable "hotspot_passphrase" {
  default = ""
}

variable "wifi_cidr_block" {
  default = "192.168.99.0/24"
}

locals {
  wifi_prefix = split("/", var.wifi_cidr_block)[1]
  wifi_address = join("/", [cidrhost(var.wifi_cidr_block, 1), local.wifi_prefix])
  dhcp_start = cidrhost(var.wifi_cidr_block, 100)
  dhcp_end = cidrhost(var.wifi_cidr_block, 199)
}

variable "wired_iface" {
  default = "eth0"
}

variable "stubby_upstream_servers" {
  type = list(object({
    ip_address = string
    tls_auth_name = string
  }))
  default = [
    {
      ip_address = "1.1.1.1"
      tls_auth_name =  "cloudflare-dns.com"
    },
    {
      ip_address = "1.0.0.1"
      tls_auth_name =  "cloudflare-dns.com"
    }
  ]
}

variable "vpn_address" {
  default = ""
}

variable "vpn_private_key" {
  default = ""
}

variable "vpn_endpoint" {
  default = ""
}

variable "vpn_endpoint_port" {
  default = ""
}

variable "vpn_endpoint_public_key" {
  default = ""
}
