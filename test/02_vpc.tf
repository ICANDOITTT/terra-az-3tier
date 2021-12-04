resource "azurerm_virtual_network" "jisoo_vpc" {
  name  =   "jisoo-vpc"
  location = azurerm_resource_group.jisoo_rg.location
  resource_group_name = azurerm_resource_group.jisoo_rg.name
  address_space = ["10.0.0.0/16"]
}