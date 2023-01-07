# RaspberryPi as Travel VPN

NOTE: This is my best effort at creating a secure gateway. That said, I'm not a network 
security expert, and per the license file, there is no warranty... only use it if 
you understand what it's doing and are comfortable with it.

This configures a RaspberryPi to be a VPN gateway for use in a hotel to get private
internet on someone else's network. 

You connect the RaspberryPi to the hotel network on the wired interface,
and then connect all your devices to the wifi hotspot it creates.

The VPN is wireguard. You will need to collect your credentials and set them in
`terraform.tfvars` as described below. I use ProtonVPN.

## Install OS

Install Raspberry Pi OS following the instructions here:

    https://www.raspberrypi.com/software/

I use the 'lite' version - the gateway doesn't need a user interface. 

Using the Imager tool, you can enable ssh and set the public key for access; it cuts out a few steps 
compared to doing it manually.

Be careful not to join a wifi network during the imaging stage: this configuration needs to configure
the wifi interface as a hotspot and it doesn't work if it is already connected to wifi.

## Connecting

Connect your Pi to your network and boot it. Once you have the IP address it is assigned from
your dhcp server, add an entry like this to you ~/.ssh/config:

    Host pigment
      Hostname <ip-address>
      User pi
      IdentityFile ~/.ssh/<private-key-file>

You can then login using: `ssh pigment` (or whatever you decide to call it).

NOTE: the name you give the host here has to match the name you give the host in the terraform
configuration below.

## Configuration

### Initial Manual Setup

Log into the Pi using ssh and run these commands:

    sudo apt update
    sudo apt dist-upgrade
    reboot

### Build Configs with Terraform

Copy the file `terraform.tfvars.examples` to `terraform.tfvars` and customise the variables.

Apply the settings:

    terraform init
    terraform apply

### Apply Configs with Ansible

Terraform create the ansible configs and run script. Apply the settings with:

    ./local/ansible/run-ansible.sh

### Post Configuration

There is an iptables rule created to allow ssh access from the wired interface so that ansible
can finish the configuration. 

You probably don't want it there long term. To get rid of it, delete it from the file
`/etc/iptables/rules.v4` and reboot.

It's the line with the comment 'delete me'.


