variable "sku" {
  description = "The VM SKU for the set"
  type = string
  default = "Standard_F2"
}

variable "admin_username" {
  description = "The name of the user to be the local administrator"
  type = string
  default = "adminuser"
}

variable "name" {
  description = "The name of the VM set"
  type = string
}

variable "location" {
  description = "The location where the set should be"
}

variable "resource_group_name" {
  description = "The name of the reource group which the set should exist"
}

variable "instance_count" {
  description = "The number of VMs to create in the set"
  default = 1
}

variable "network_interface" {
  description = "The network interface to use"
  type = map(any)
}

variable "tags" {
  description = "Map of tags to add to the set"
  type = map(string)
  default = {}
}

variable "custom_tags" {
  description = "Map of tags which will be added to the set by default"
  type = map(string)
  default = {
    created_by = "terraform-azurerm-linux-scale-set"
  }
}
