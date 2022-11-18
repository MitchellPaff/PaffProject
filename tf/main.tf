resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

resource "azurerm_storage_account" "paffstorageaccount2" {
  name                     = "paffstorageaccount2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "paffstoragecontainer2" {
  name                  = "paffstoragecontainer2"
  storage_account_name  = azurerm_storage_account.paffstorageaccount2.name
  container_access_type = "private"
}
