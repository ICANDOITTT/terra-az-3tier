resource "azurerm_snapshot" "jisoo_snapshot" {
    name = "jisoo-snapshot"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    create_option = "Copy"
    source_uri =  "/subscriptions/268a434d-f7e6-4966-bb27-d29e20a1b360/resourceGroups/jisoo-rg/providers/Microsoft.Compute/disks/jisoo-osdisk2"
}