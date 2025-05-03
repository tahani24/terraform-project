resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = "my-vmss"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard_B2s"
  instances           = 1
  admin_username      = "adminuser"

  source_image_id     = var.image_id

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/vmss.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = azurerm_subnet.subnet_1.id
      primary   = true
      application_gateway_backend_address_pool_ids = [
      element(azurerm_application_gateway.example.backend_address_pool[*].id, 0)
      ]
    }
  }

  upgrade_mode = "Manual"
}

resource "azurerm_network_security_group" "vmss_nsg" {
  name                = "vmss-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowHttp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "vmss_subnet_nsg" {
  subnet_id                 = azurerm_subnet.subnet_1.id
  network_security_group_id = azurerm_network_security_group.vmss_nsg.id
}

