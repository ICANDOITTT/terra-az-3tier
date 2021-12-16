resource "azurerm_network_security_group" "jisoo_nsg1" {
    name = "jisoo-nsg1"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    security_rule {
        name = "http-rule"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "80"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    depends_on = [azurerm_subnet.jisoo_sub1]

}

resource "azurerm_network_security_group" "jisoo_nsg2" {
    name = "jisoo-nsg2"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    
    security_rule {
        name = "ssh-rule"
        priority = 1000
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name = "http-rule"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "80"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    depends_on = [azurerm_subnet.jisoo_sub2]

}

resource "azurerm_network_security_group" "jisoo_nsg3" {
    name = "jisoo-nsg3"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    security_rule {
        name = "tomcat-rule"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "8080"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    depends_on = [azurerm_subnet.jisoo_sub3]

}

resource "azurerm_network_security_group" "jisoo_nsg4" {
    name = "jisoo-nsg4"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    depends_on = [azurerm_subnet.jisoo_sub4]

}

resource "azurerm_network_security_group" "jisoo_nsg6" {
    name = "jisoo-nsg6"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name

    security_rule {
        name = "http-rule"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "80"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name = "tomcat-rule"
        priority = 110
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "8080"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    depends_on = [azurerm_subnet.jisoo_sub6]
}