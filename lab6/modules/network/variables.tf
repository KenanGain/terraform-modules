variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "subnet1_name" {
  description = "The name of the first subnet"
  type        = string
}

variable "subnet2_address_prefix" {
  description = "The address prefix of the first subnet"
  type        = list(string)
}

variable "subnet2_name" {
  description = "The name of the second subnet"
  type        = string
}

variable "subnet1_address_prefix" {
  description = "The address prefix of the second subnet"
  type        = list(string)
}

variable "nsg1_name" {
  description = "The name of the first network security group"
  type        = string
}

variable "nsg2_name" {
  description = "The name of the second network security group"
  type        = string
}

variable "location" {
  description = "The location for resources"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}
