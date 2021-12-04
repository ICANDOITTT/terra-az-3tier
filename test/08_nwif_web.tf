resource "azurerm_network_interface" "jisoo_nwif1" {
    name = "jisoo-nwif1"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.jisoo_sub2.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface_backend_address_pool_association" "jisoo_backass1" {
    network_interface_id = azurerm_network_interface.jisoo_nwif1.id
    ip_configuration_name = "internal"
    backend_address_pool_id = azurerm_lb_backend_address_pool.jisoo_backend.id
}