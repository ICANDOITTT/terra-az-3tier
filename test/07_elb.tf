resource "azurerm_public_ip" "jisoo_lbip" {
    name = "jisoo-lbip"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_lb" "jisoo_lb" {
    name = "jisoo-lb"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    sku = "Standard"

    frontend_ip_configuration {
        name = "publicIPAddress"
        public_ip_address_id = azurerm_public_ip.jisoo_lbip.id
    }
}

resource "azurerm_lb_backend_address_pool" "jisoo_backend" {
    loadbalancer_id = azurerm_lb.jisoo_lb.id
    name = "jisoo-backend"
}

resource "azurerm_lb_probe" "jisoo_lbprobe" {
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    loadbalancer_id = azurerm_lb.jisoo_lb.id
    name = "jisoo-lbprobe"
    port = 80
}

resource "azurerm_lb_rule" "jisoo_inbound" {
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    loadbalancer_id = azurerm_lb.jisoo_lb.id
    name = "jisoo-inbound"
    frontend_ip_configuration_name = "publicIPAddress"
    backend_address_pool_ids = [ azurerm_lb_backend_address_pool.jisoo_backend.id ]
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    probe_id = azurerm_lb_probe.jisoo_lbprobe.id
    disable_outbound_snat = "true"
}

resource "azurerm_lb_outbound_rule" "jisoo_outb" {
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    loadbalancer_id = azurerm_lb.jisoo_lb.id
    name = "jisoo-outb"
    protocol = "All"
    backend_address_pool_id = azurerm_lb_backend_address_pool.jisoo_backend.id
    allocated_outbound_ports = "1024"

    frontend_ip_configuration {
        name = "publicIPAddress"
    }
}