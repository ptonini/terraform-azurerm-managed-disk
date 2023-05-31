variable "name" {}

variable "rg" {}

variable "storage_account_type" {}

variable "create_option" {
  default = "Empty"
}

variable "disk_size_gb" {}

variable "virtual_machine_id" {
  default = null
}

variable "virtual_machine_attachment_lun" {
  default = null
  type    = number
}

variable "virtual_machine_attachment_caching" {
  default = "ReadWrite"
}