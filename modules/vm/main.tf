# refer to a resource group
resource "azurerm_resource_group" "rg" {
  name =  var.rg-name
  location = var.location
  tags = var.tags
}

data "azurerm_resource_group" "vnet-rg" {
  name = var.vnet-rg
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
}

#refer to a subnet
data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.vnet-rg.name
}

# create a network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm-name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.vm-name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    #public_ip_address_id          = "${azurerm_public_ip.test.id}"
  }
  tags = var.tags
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.vm-name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = var.tags

  security_rule {
    name                       = "allow-storage"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "80-443"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    
  }

}


resource "azurerm_network_interface_security_group_association" "nsg-nic-join" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}




resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm-name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_A4_v2"
  admin_username      = "adminuser"
  admin_password      = "MyPassword@123"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = var.tags
}