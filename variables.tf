variable "proxmox_api_url" {
type        = string
description = "The URL for the Proxmox API (e.g., https://your_proxmox_ip:8006/api2/json)"
}

variable "proxmox_user" {
type        = string
description = "The Proxmox user (e.g., root@pam)"
}

variable "proxmox_password" {
type        = string
description = "The Proxmox user's password"
sensitive   = true
}
