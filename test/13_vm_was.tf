resource "azurerm_virtual_machine" "jisoo_vm_was" {
    name = "jisoo-vm-was"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    network_interface_ids = [azurerm_network_interface.jisoo_nwif_was.id]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }


    storage_os_disk {
        name = "jisoo-osdisk2"
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