resource "azurerm_network_interface" "nic" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip}"
  }
}

data "azurerm_image" "packerImage" {
  resource_group_name = "Image-RG"
  name = "LinuxVM"
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_DS2_v2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic.id]
  source_image_id = data.azurerm_image.packerImage.id
  
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
