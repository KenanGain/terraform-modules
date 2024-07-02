resource "azurerm_availability_set" "windows_avs" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.rg_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}

resource "azurerm_network_interface" "windows_nic" {
  count               = var.nb_count
  name                = "${var.windows_name}-nic-${format("%1d",count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.windows_name}-ipconfig-${format("%1d",count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[count.index].id
  }

  tags = local.common_tags
}

resource "azurerm_public_ip" "windows_pip" {
  count               = var.nb_count
  name                = "${var.windows_name}-pip-${format("%1d",count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.windows_name}-${format("%1d",count.index + 1)}"

  tags = local.common_tags
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count               = var.nb_count
  name                = "${var.windows_name}${format("%1d",count.index + 1)}"
  computer_name       = "hostname-${format("%1d",count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  availability_set_id = azurerm_availability_set.windows_avs.id
  size                = var.windows_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.windows_nic[count.index].id,
  ]

  os_disk {
    name                 = "${var.windows_name}-os-disk-${format("%1d",count.index + 1)}"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

   winrm_listener {
    protocol = "Http"
  }

  tags = local.common_tags
}


