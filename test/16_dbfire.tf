resource "azurerm_mysql_firewall_rule" "jisoo_dbwall" {
    name = "jisoo-dbwall"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    server_name = azurerm_mysql_server.jisoo_myser.name
    start_ip_address = "0.0.0.0"
    end_ip_address = "0.0.0.0"
}