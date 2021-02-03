output "vm_id" {
  description = "The ID of the VM set"
  value = azurerm_linux_virtual_machine_scale_set.virtual_machine.id
}
