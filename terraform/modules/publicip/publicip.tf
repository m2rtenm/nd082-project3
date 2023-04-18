resource "azurerm_public_ip" "vm_publicip" {
  name                = "${var.application_type}-${var.resource_type}-pubip"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  allocation_method   = "Dynamic"

}