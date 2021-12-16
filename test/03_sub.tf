resource "azurerm_subnet" "jisoo_sub1" {
    name = "subnet01-elb"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    virtual_network_name = azurerm_virtual_network.jisoo_vpc.name
    address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "jisoo_sub2" {
    name = "subnet02-web"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    virtual_network_name = azurerm_virtual_network.jisoo_vpc.name
    address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "jisoo_sub3" {
    name = "subnet03-was"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    virtual_network_name = azurerm_virtual_network.jisoo_vpc.name
    address_prefixes = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "jisoo_sub4" {
    name = "subnet04-db"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    virtual_network_name = azurerm_virtual_network.jisoo_vpc.name
    address_prefixes = ["10.0.4.0/24"]
}

resource "azurerm_subnet" "jisoo_sub5" {
    name = "AzureBastionSubnet"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    virtual_network_name = azurerm_virtual_network.jisoo_vpc.name
    address_prefixes = ["10.0.5.0/24"]
}

resource "azurerm_subnet" "jisoo_sub6" {
    name = "subnet06-snapshot"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    virtual_network_name = azurerm_virtual_network.jisoo_vpc.name
    address_prefixes = ["10.0.6.0/24"]
}