Terraform को लागि Proxmox प्रदायक (provider)
Terraform configuration for the Proxmox provider
terraform {
required_providers {
proxmox = {
source = "bpg/proxmox"
version = "0.33.0"
}
}
}

Proxmox को सर्भरमा जडान गर्नको लागि कन्फिगरेसन
Configuration to connect to the Proxmox server
provider "proxmox" {
pm_api_url  = var.proxmox_api_url
pm_user     = var.proxmox_user
pm_password = var.proxmox_password
pm_tls_insecure = true
}

नयाँ भर्चुअल मेसिन (VM) बनाउनको लागि स्रोत (resource)
Resource to create a new virtual machine (VM)
resource "proxmox_vm_qemu" "vm-example" {
name        = "ubuntu-vm"
target_node = "pve" # तपाईंको Proxmox नोडको नाम | Your Proxmox node's name
agent       = 1
onboot      = true
cores       = 2
sockets     = 1
memory      = 2048 # 2GB RAM
disk {
storage = "local-lvm"
size    = "20G"
}
clone       = "ubuntu-22-04-cloudinit"
os_type     = "cloud-init"
network {
bridge = "vmbr0"
}
}
