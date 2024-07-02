variable "networking_rg_name" {
  type = string
}

variable "linux_rg_name" {
  type = string
}

variable "windows_rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "ARM_SUBSCRIPTION_ID" {
  type    = string
  default = ""
}

variable "ARM_CLIENT_ID" {
  type    = string
  default = ""
}

variable "ARM_CLIENT_SECRET" {
  type    = string
  default = ""
}

variable "ARM_TENANT_ID" {
  type    = string
  default = ""
}

variable "availability_set_name" {
  description = "The name of the availability set"
  type        = string
  default = "linux_avs"
}

variable "linux_name" {
  description = "Name of the Linux virtual machine"
  type        = string
  default     = "n01581401-u-vm1"
}

variable "linux_size" {
  description = "Size of the Linux virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the Linux virtual machine"
  type        = string
  default     = "n01581401"
}

variable "admin_password" {
  description = "Admin password for the Linux virtual machine"
  type        = string
  default     = "n01581401"
}

variable "public_key" {
  description = "Public key for SSH access"
  type        = string
  default     = "/home/n01581401/.ssh/id_rsa.pub"
}

variable "os_disk_caching" {
  description = "The caching setting for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
  default     = "Premium_LRS"
}

variable "os_disk_size" {
  description = "The size of the OS disk in GB"
  type        = number
  default     = 32
}

variable "os_publisher" {
  description = "The publisher of the OS image"
  type        = string
  default     = "Canonical"
}

variable "os_offer" {
  description = "The offer of the OS image"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "os_sku" {
  description = "The SKU of the OS image"
  type        = string
  default     = "22_04-lts"
}

variable "os_version" {
  description = "The version of the OS image"
  type        = string
  default     = "latest"
}

variable "nb_count" {
  description = "The number of VMs to create"
  type        = number
  default     = 2
}
variable "windows_availability_set_name" {
  description = "The name of the availability set for Windows VMs"
  type        = string
  default     = "windows-availability-set"
}

variable "windows_name" {
  description = "Name of the Windows virtual machine"
  type        = string
  default     = "n01581401-w-vm1"
}

variable "windows_size" {
  description = "Size of the Windows virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "windows_admin_username" {
  description = "Admin username for the Windows virtual machine"
  type        = string
  default     = "n01581401"
}

variable "windows_admin_password" {
  description = "Admin password for the Windows virtual machine"
  type        = string
  default     = "n01581401@1234"
}

variable "windows_os_disk_caching" {
  description = "Caching mode for the Windows OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "windows_os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
  default     = "StandardSSD_LRS"
}

variable "windows_os_disk_size" {
  description = "Size of the Windows OS disk in GB"
  type        = number
  default     = 128
}

variable "windows_os_publisher" {
  description = "Publisher of the Windows OS"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "windows_os_offer" {
  description = "Offer of the Windows OS"
  type        = string
  default     = "WindowsServer"
}

variable "windows_os_sku" {
  description = "SKU of the Windows OS"
  type        = string
  default     = "2016-Datacenter"
}

variable "windows_os_version" {
  description = "Version of the Windows OS"
  type        = string
  default     = "latest"
}