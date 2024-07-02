resource "azurerm_availability_set" "linux_avs" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.rg_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}

resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${format("%1d",count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${format("%1d",count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[count.index].id
  }

  tags = local.common_tags
}

resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d",count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}-${format("%1d",count.index + 1)}"
  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  count               = var.nb_count
  name                = "${var.linux_name}${format("%1d",count.index + 1)}"
  computer_name       = "hostname-${format("%1d",count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  availability_set_id = azurerm_availability_set.linux_avs.id
  size                = var.linux_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.linux_nic[count.index].id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d",count.index + 1)}"
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

  tags = local.common_tags
}