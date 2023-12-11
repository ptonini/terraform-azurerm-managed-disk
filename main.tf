resource "azurerm_managed_disk" "this" {
  name                 = var.name
  location             = var.rg.location
  resource_group_name  = var.rg.name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  lifecycle {
    ignore_changes = [
      tags["business_unit"],
      tags["environment"],
      tags["product"],
      tags["subscription_type"]
    ]
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  count              = var.virtual_machine_id == null ? 0 : 1
  managed_disk_id    = azurerm_managed_disk.this.id
  virtual_machine_id = var.virtual_machine_id
  lun                = var.virtual_machine_attachment_lun
  caching            = var.virtual_machine_attachment_caching
}