# resource "azurerm_resource_group" "demo" {
#   name     = "my-name"
#   location = "Canada Central"
# }

# Look up a resource group
data "azurerm_resource_group" "demo" {
  name = "first-last"
}

# Create the network and subnet
# Potential for module
resource "azurerm_virtual_network" "demo" {
  name                = "demo-network"
  resource_group_name = data.azurerm_resource_group.demo.name
  location            = data.azurerm_resource_group.demo.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = data.azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Without the use of variables
# module "linux_vm_set" {
#   source              = "../"
#   instance_count      = 1
#   name                = "demo-linux-vm-set"
#   location            = data.azurerm_resource_group.demo.location
#   resource_group_name = data.azurerm_resource_group.demo.name
#   network_interface   = {name = "demo", subnet_id = azurerm_subnet.internal.id}
#   tags                = {costcenter = "777747", client = "demo"}
# }

# With the use of variables
module "linux_vm_set" {
  source              = "../"
  name                = var.name
  location            = data.azurerm_resource_group.demo.location
  resource_group_name = data.azurerm_resource_group.demo.name
  network_interface   = local.network_interface
  tags                = var.tags
}
