resource "azurerm_virtual_network" "vn" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "sn1" {
  name                 = var.subnet1_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.subnet1_address_prefix
}

resource "azurerm_subnet" "sn2" {
  name                 = var.subnet2_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.subnet2_address_prefix
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1_name
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2_name
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sn1_nsg1" {
  subnet_id                 = azurerm_subnet.sn1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "sn2_nsg2" {
  subnet_id                 = azurerm_subnet.sn2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}
