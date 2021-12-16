/*resource "azurerm_public_ip" "jisoo_imvm_publicip" {
    name = "jisoo-imvm-publicip"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    location = azurerm_resource_group.jisoo_rg.location
    allocation_method = "Static"
} */

resource "azurerm_network_interface" "jisoo_nwif_imvm" {
    name = "jisoo-nwif-imvm"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    ip_configuration {
        name = "internal3"
        subnet_id = azurerm_subnet.jisoo_sub3.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface_backend_address_pool_association" "jisoo_backass2" {
    network_interface_id = azurerm_network_interface.jisoo_nwif_imvm.id
    ip_configuration_name = "internal3"
    backend_address_pool_id = azurerm_lb_backend_address_pool.jisoo_ilb_backend.id
}