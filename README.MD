# A Proxmox terraform module to create cloud-init vm's

## Usage

```HCL
module "proxmox" {
  source = "github.com/lwijnsma/proxmox-terrafrom-cloudinit-module"

  pve_endpoint = "https://proxmox.example.com:8006"
  pve_user = root
  pve_password = <YOUR_PROXMOX_PASSWORD>
  pve_ip = "192.168.254.125"

  vm_hostname = "module-test"
  vm_username = "example"

  vm_clone_id = 9001

  sshkeys = ["ssh-ed25519 SOMEKEY"]
}
```