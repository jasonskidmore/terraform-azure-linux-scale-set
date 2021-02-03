resource "azurerm_linux_virtual_machine_scale_set" "virtual_machine" {
  instances                       = var.instance_count
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  admin_username                  = var.admin_username
  admin_password                  = "MysecretPassword#24077"
  sku                             = var.sku
  tags                            = merge(var.custom_tags, var.tags)
  disable_password_authentication = false

  network_interface {
    name    = lookup(var.network_interface, "name", "demo")
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = lookup(var.network_interface, "subnet_id", "")
    }
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_ed25519_github_jskid.pub")
  # }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
