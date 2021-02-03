locals {
  network_interface = merge(var.network_interface, {subnet_id = azurerm_subnet.internal.id})
}
