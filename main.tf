terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.50.0"
    }
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.8.5"
    }
  }
}