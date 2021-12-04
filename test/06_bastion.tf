resource "azurerm_public_ip" "jisoo_bastionip" {
    name = "jisoo-bastionip"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_bastion_host" "jisoo_bastion" {
    name = "jisoo-bastion"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    ip_configuration {
        name = "configuration"
        subnet_id = azurerm_subnet.jisoo_sub5.id
        public_ip_address_id = azurerm_public_ip.jisoo_bastionip.id
    }
}