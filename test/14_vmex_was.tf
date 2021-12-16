resource "azurerm_virtual_machine_extension" "jisoo_vmex_was" {
    name = "jisoo-vmex-was"
    virtual_machine_id = azurerm_virtual_machine.jisoo_vm_was.id
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"

    settings = <<SETTINGS
    {
        "script": "${filebase64("install2.sh")}"
    }
    SETTINGS
}