resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass1" {
    subnet_id = azurerm_subnet.jisoo_sub1.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg1.id
    depends_on = [azurerm_network_security_group.jisoo_nsg1]
}

resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass2" {
    subnet_id = azurerm_subnet.jisoo_sub2.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg2.id

    depends_on = [azurerm_network_security_group.jisoo_nsg2]
}

resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass3" {
    subnet_id = azurerm_subnet.jisoo_sub3.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg3.id

    depends_on = [azurerm_network_security_group.jisoo_nsg3]
}

resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass4" {
    subnet_id = azurerm_subnet.jisoo_sub4.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg4.id

    depends_on = [azurerm_network_security_group.jisoo_nsg4]
}

resource "azurerm_subnet_network_security_group_association" "jisoo_nsgass6" {
    subnet_id = azurerm_subnet.jisoo_sub6.id
    network_security_group_id = azurerm_network_security_group.jisoo_nsg6.id

    depends_on = [azurerm_network_security_group.jisoo_nsg6]
}
