variable "pve_endpoint" {
  type = string
}
variable "pve_ip" {
  type = string
}
variable "pve_node" {
  type = string
  default = "pve"
}
variable "pve_username" {
  type = string
  default = "root"
}
variable "pve_password" {
  type = string
  sensitive = true
}
variable "vm_clone_id" {
  type = number
  validation {
    condition     = var.vm_clone_id >= 1 && var.vm_clone_id <= 9999 && floor(var.vm_clone_id) == var.vm_clone_id
    error_message = "Accepted values: 1-9999."
  }
}
variable "vm_hostname" {
  type = string
}
variable "vm_username" {
  type = string  
}
variable "vm_tags" {
  type = list(string)
  default = ["terraform"]  
}
variable "vm_bridge" {
  type = string
  default = "vmbr2"
}
variable "vm_vlan" {
  type = string 
  default = 1610
}
variable "vm_datastore" {
  type = string
  default = "NVME2"
}
variable "sshkeys" {
  type = list(string)
}
variable "ipv4" {
  type = object({
    address = string
    gateway = optional(string)
  })
  default = {
    address = "dhcp"
  }
}
