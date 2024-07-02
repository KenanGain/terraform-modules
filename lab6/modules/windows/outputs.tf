output "windows_vm_names" {
  value = azurerm_windows_virtual_machine.windows_vm[*].name
}

output "windows_vm_private_ips" {
  value = azurerm_network_interface.windows_nic[*].private_ip_address
}

output "windows_vm_public_ips" {
  value = azurerm_public_ip.windows_pip[*].ip_address
}

output "windows_vm_hostnames" {
  value = azurerm_windows_virtual_machine.windows_vm[*].computer_name
}