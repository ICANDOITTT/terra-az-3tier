resource "azurerm_virtual_machine" "jisoo_imvm" {
    name = "jisoo-vimvm"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    network_interface_ids = [azurerm_network_interface.jisoo_nwif_imvm.id]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
        //publisher = "jisoo-image-publisher"
        //offer     = "jisoo-image-offer"
        //sku       = "jisoo-image-sku"
        id   = azurerm_shared_image_version.jisoo_imagev.id
    }


    storage_os_disk {
        name = "jisoo-osdisk3"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "StandardSSD_LRS"
        
    }

    os_profile {
        computer_name = "was"
        admin_username = "nana"
        admin_password = "gkwltnsmscjswo1!"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}