variable "rgs1" { }
variable "storage_account" {}


resource "azurerm_resource_group" "rg1" {
  for_each = var.rgs1
  
  name     = each.key
  location = each.value
}

resource "azurerm_storage_account" "storage_account" {
  depends_on = [azurerm_resource_group.rg1]
  for_each = var.storage_account
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

}




