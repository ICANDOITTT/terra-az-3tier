resource "azurerm_shared_image_gallery" "jisoo_gallery" {
    name = "jisoogallery"
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    location = azurerm_resource_group.jisoo_rg.location
    description = "Shared images and things"
}

resource "azurerm_shared_image" "jisoo_shimage" {
    name = "jisoo-shared-image"
    gallery_name = azurerm_shared_image_gallery.jisoo_gallery.name
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    location = azurerm_resource_group.jisoo_rg.location
    os_type = "Linux"

    identifier {
        publisher = "jisoo-image-publisher"
        offer     = "jisoo-image-offer"
        sku       = "jisoo-image-sku"
    }
}

resource "azurerm_shared_image_version" "jisoo_imagev" {
    name = "1.0.0"
    gallery_name = azurerm_shared_image.jisoo_shimage.gallery_name
    image_name = azurerm_shared_image.jisoo_shimage.name
    resource_group_name = azurerm_shared_image.jisoo_shimage.resource_group_name
    location = azurerm_shared_image.jisoo_shimage.location
    os_disk_snapshot_id = azurerm_snapshot.jisoo_snapshot.id

    target_region {
        name = azurerm_shared_image.jisoo_shimage.location
        regional_replica_count = 1
        storage_account_type = "Standard_LRS"
    }


}