output "networking_rg_name" {
  value = module.resource_group.networking_rg_name
}

output "linux_rg_name" {
  value = module.resource_group.linux_rg_name
}

output "windows_rg_name" {
  value = module.resource_group.windows_rg_name
}

output "virtual_network_name" {
  value = module.network.virtual_network_name
}

output "virtual_network_address_space" {
  value = module.network.virtual_network_address_space
}

output "subnet1_name" {
  value = module.network.subnet1_name
}

output "subnet2_name" {
  value = module.network.subnet2_name
}

output "subnet1_address_space" {
  value = module.network.subnet1_prefix
}

output "subnet1_address_prefix" {
  value = module.network.subnet1_prefix
}

output "nsg1_name" {
  value = module.network.nsg1_name
}

output "nsg2_name" {
  value = module.network.nsg2_name
}

# output "linux_vm_names" {
#   value = module.linux_vms.linux_vm_names
# }

# output "linux_vm_private_ips" {
#   value = module.linux_vms.linux_vm_private_ips
# }

# output "linux_vm_public_ips" {
#   value = module.linux_vms.linux_vm_public_ips
# }

# output "linux_vm_hostnames" {
#   value = module.linux_vms.linux_vm_hostnames
# }

# output "windows_vm_names" {
#   value = module.windows_vms.windows_vm_names
# }

# output "windows_vm_private_ips" {
#   value = module.windows_vms.windows_vm_private_ips
# }

# output "windows_vm_public_ips" {
#   value = module.windows_vms.windows_vm_public_ips
# }

# output "windows_vm_hostnames" {
#   value = module.windows_vms.windows_vm_hostnames
# }