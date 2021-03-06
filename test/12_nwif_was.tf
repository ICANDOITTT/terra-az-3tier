resource "azurerm_public_ip" "jisoo_was_publicip" {
    name = "jisoo-was-publicip"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    location = azurerm_resource_group.jisoo_rg.location
    allocation_method = "Static"
}

resource "azurerm_network_interface" "jisoo_nwif_was" {
    name = "jisoo-nwif-was"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    ip_configuration {
        name = "internal2"
        subnet_id = azurerm_subnet.jisoo_sub6.id
        public_ip_address_id = azurerm_public_ip.jisoo_was_publicip.id
        private_ip_address_allocation = "Dynamic"
    }
}

#ILB bakcend pool 연결부분
/* resource "azurerm_network_interface_backend_address_pool_association" "jisoo_backass2" {
    network_interface_id = azurerm_network_interface.jisoo_nwif_was.id
    ip_configuration_name = "internal2"
    backend_address_pool_id = azurerm_lb_backend_address_pool.jisoo_ilb_backend.id
}*/