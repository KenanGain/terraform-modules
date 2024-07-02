output "linux_vm_names" {
  value = azurerm_linux_virtual_machine.linux_vm[*].name
}

output "linux_vm_private_ips" {
  value = azurerm_network_interface.linux_nic[*].private_ip_address
}

output "linux_vm_public_ips" {
  value = azurerm_public_ip.linux_pip[*].ip_address
}

output "linux_vm_hostnames" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}