
locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01581401@humber.ca"
    Environment  = "Lab"
  }
}
variable "availability_set_name" {
  description = "The name of the availability set"
  type        = string
}

variable "linux_name" {
  description = "Name of the Linux virtual machine"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the VM NICs"
  type        = string
}

variable "linux_size" {
  description = "Size of the Linux virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Linux virtual machine"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Linux virtual machine"
  type        = string
}

variable "public_key" {
  description = "Public key for SSH access"
  type        = string
}

variable "os_disk_caching" {
  description = "The caching setting for the OS disk"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
}

variable "os_disk_size" {
  description = "The size of the OS disk in GB"
  type        = number
}

variable "os_publisher" {
  description = "The publisher of the OS image"
  type        = string
}

variable "os_offer" {
  description = "The offer of the OS image"
  type        = string
}

variable "os_sku" {
  description = "The SKU of the OS image"
  type        = string
}

variable "os_version" {
  description = "The version of the OS image"
  type        = string
}

variable "nb_count" {
  description = "The number of VMs to create"
  type        = number
}