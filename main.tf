terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "f0c6c28a-7429-42b3-aefa-63439e20a651"
}



resource "azurerm_resource_group" "example" {
  name     = "-rg"
  location = "WestEurope"
}

resource "azurerm_storage_account" "example" {
  name                     = "-account"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
 
}
