output "instance_ip_addr" {
  value = proxmox_virtual_environment_vm.ubuntu_vm.ipv4_addresses
}