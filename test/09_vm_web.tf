resource "azurerm_virtual_machine" "jisoo_vm_web" {
    name = "jisoo-vm-web"
    location = azurerm_resource_group.jisoo_rg.location
    resource_group_name = azurerm_resource_group.jisoo_rg.name
    network_interface_ids = [azurerm_network_interface.jisoo_nwif1.id]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
      publisher = "OpenLogic"
      offer = "CentOS"
      sku   = "7.5"
      version = "latest"
    }


    storage_os_disk {
        name = "jisoo-osdisk1"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "StandardSSD_LRS"
    }

    os_profile {
        computer_name = "web"
        admin_username = "nana"
        admin_password = "gkwltnsmscjswo1!"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}