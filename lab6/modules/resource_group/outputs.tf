output "networking_rg_name" {
  value = azurerm_resource_group.rg.name
}

output "linux_rg_name" {
  value = azurerm_resource_group.linux_rg.name
}

output "windows_rg_name" {
  value = azurerm_resource_group.windows_rg.name
}
