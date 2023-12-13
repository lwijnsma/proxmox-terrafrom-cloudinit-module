resource "proxmox_virtual_environment_file" "user_data" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.pve_node

  source_raw {
    data = <<EOF
#cloud-config
hostname: ${var.vm_hostname}
packages:
  - qemu-guest-agent
package_update: true
package_upgrade: true
package_reboot_if_required: true
users:
  - default
    name: ${var.vm_username}
    groups: sudo
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh-authorized-keys:
      ${yamlencode(var.sshkeys)}
EOF

    file_name = "cloud-config.yaml"
  }
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name        = var.vm_hostname
  description = "Managed by Terraform"
  tags        = ["terraform"]

  node_name = var.pve_node

  clone {
    vm_id = "${var.vm_clone_id}"
  }
  
  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
    user_data_file_id = proxmox_virtual_environment_file.user_data.id
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = "1610"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}
