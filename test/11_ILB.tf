resource "azurerm_lb" "jisoo_ilb" {
    name = "jisoo-ilb"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    sku = "Standard"

    frontend_ip_configuration {
        name = "privateIPAddress"
        private_ip_address_allocation = "Dynamic"
        subnet_id = azurerm_subnet.jisoo_sub3.id
    }
}

resource "azurerm_lb_backend_address_pool" "jisoo_ilb_backend" {
    loadbalancer_id = azurerm_lb.jisoo_ilb.id
    name = "jisoo-ilb-backend"
}

resource "azurerm_lb_probe" "jisoo_ilbprobe" {
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    loadbalancer_id = azurerm_lb.jisoo_ilb.id
    name = "jisoo-ilbprobe"
    port = 8080
}

resource "azurerm_lb_rule" "jisoo_ilb_inbound" {
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    loadbalancer_id = azurerm_lb.jisoo_ilb.id
    name = "jisoo-ilb_inbound"
    frontend_ip_configuration_name = "privateIPAddress"
    backend_address_pool_ids = [ azurerm_lb_backend_address_pool.jisoo_ilb_backend.id ]
    protocol = "Tcp"
    frontend_port = 8080
    backend_port = 8080
    probe_id = azurerm_lb_probe.jisoo_ilbprobe.id
    disable_outbound_snat = "true"
}