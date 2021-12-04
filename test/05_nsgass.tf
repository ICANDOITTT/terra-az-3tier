resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass1" {
    subnet_id = azurerm_subnet.jisoo_sub1.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass2" {
    subnet_id = azurerm_subnet.jisoo_sub2.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg2.id
}

resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass3" {
    subnet_id = azurerm_subnet.jisoo_sub3.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg3.id
}

resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass4" {
    subnet_id = azurerm_subnet.jisoo_sub4.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg4.id
}
