terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = var.pve_endpoint
  username = "${var.pve_username}@pam"
  password = var.pve_password
  ssh {
    username = var.pve_username
    node {
      name = var.pve_node
      address = var.pve_ip
    } 
  }
}