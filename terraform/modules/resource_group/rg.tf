resource "azurerm_resource_group" "vm_rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}