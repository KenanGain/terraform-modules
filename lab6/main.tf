module "resource_group" {
  source = "./modules/resource_group"

  networking_rg_name = var.networking_rg_name
  linux_rg_name      = var.linux_rg_name
  windows_rg_name    = var.windows_rg_name
  location           = var.location
}

module "network" {
  source = "./modules/network"

  virtual_network_name         = "network-vnet"
  virtual_network_address_space = ["10.0.0.0/16"]
  subnet1_name                 = "network-subnet1"
  subnet1_address_prefix       = ["10.0.1.0/24"]
  subnet2_name                 = "network-subnet2"
  subnet2_address_prefix       = ["10.0.2.0/24"]
  nsg1_name                    = "network-nsg1"
  nsg2_name                    = "network-nsg2"
  location                     = var.location
  rg_name                      = module.resource_group.networking_rg_name
}

module "linux_vms" {
  source = "./modules/linux"

  availability_set_name        = "linux-availability-set"
  linux_name                   = var.linux_name
  location                     = var.location
  rg_name                      = module.resource_group.linux_rg_name
  subnet_id                    = module.network.subnet1_id
  linux_size                   = var.linux_size
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  public_key                   = var.public_key
  os_disk_caching              = var.os_disk_caching
  os_disk_storage_account_type = var.os_disk_storage_account_type
  os_disk_size                 = var.os_disk_size
  os_publisher                 = var.os_publisher
  os_offer                     = var.os_offer
  os_sku                       = var.os_sku
  os_version                   = var.os_version
  nb_count                     = var.nb_count
}

module "windows_vms" {
  source = "./modules/windows"

  availability_set_name        = var.windows_availability_set_name
  windows_name                 = var.windows_name
  location                     = var.location
  rg_name                      = module.resource_group.windows_rg_name
  subnet_id                    = module.network.subnet2_id
  windows_size                 = var.windows_size
  admin_username               = var.windows_admin_username
  admin_password               = var.windows_admin_password
  os_disk_caching              = var.windows_os_disk_caching
  os_disk_storage_account_type = var.windows_os_disk_storage_account_type
  os_disk_size                 = var.windows_os_disk_size
  os_publisher                 = var.windows_os_publisher
  os_offer                     = var.windows_os_offer
  os_sku                       = var.windows_os_sku
  os_version                   = var.windows_os_version
  nb_count                     = var.nb_count
}