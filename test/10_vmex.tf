resource "azurerm_virtual_machine_extension" "jisoo_vmex" {
    name = "jisoo-vmex"
    virtual_machine_id = azurerm_virtual_machine.jisoo_vm_web.id
    publisher ="Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"

    settings = <<SETTINGS
    {
        "script": "${filebase64("install1.sh")}"
    }
    SETTINGS
}