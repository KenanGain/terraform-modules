variable "networking_rg_name" {
  type        = string
  description = "Name of the networking resource group"
}

variable "linux_rg_name" {
  type        = string
  description = "Name of the Linux resource group"
}

variable "windows_rg_name" {
  type        = string
  description = "Name of the Windows resource group"
}

variable "location" {
  type        = string
  description = "Location for the resource groups"
}
