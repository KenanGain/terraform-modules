output "virtual_network_name" {
  value = azurerm_virtual_network.vn.name
}

output "virtual_network_address_space" {
  value = azurerm_virtual_network.vn.address_space
}

output "subnet1_name" {
  value = azurerm_subnet.sn1.name
}

output "subnet2_name" {
  value = azurerm_subnet.sn2.name
}

output "nsg1_name" {
  value = azurerm_network_security_group.nsg1.name
}

output "nsg2_name" {
  value = azurerm_network_security_group.nsg2.name
}

output "subnet1_id" {
  value = azurerm_subnet.sn1.id
}

output "subnet2_id" {
  value = azurerm_subnet.sn2.id
}

output "subnet1_prefix" {
  value = azurerm_subnet.sn1.address_prefixes
}

output "subnet2_prefix" {
  value = azurerm_subnet.sn2.address_prefixes
}