# Proxmox - Netbox - Cloud-init
| A Proxmox terraform module to create cloud-init vm's and add them to Netbox

## Usage

```HCL
module "proxmox" {
  source = "github.com/lwijnsma/proxmox-terrafrom-cloudinit-module"

  vm_cpus = 2
  vm_memory = 2048

  vm_disk_size = 20
  vm_datastore = "local-lvm"
  
  qemu_agent = true

  vm_hostname = "test"
  vm_username = "username"
  sshkeys = ["ssh-ed25519 <SSH_KEY>"]
  
  vm_vlan = "1"
  ipv4 = {
    address = "xx.xx.xx.xx/24"
    gateway = "xx.xx.xx.xx"
  }
}
```