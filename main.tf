terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
 backend "azurerm" {
    resource_group_name = "-rg"
    storage_account_name = "-account"                                
    container_name       = "abc"                                 
    key                  = "terraform.tfstate"                
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
    depends_on = [ azurerm_resource_group.example ]
  name                     = "-account"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
 
}



    
resource "azurerm_storage_container" "example" {
    depends_on = [ azurerm_storage_account.example ]
  name                  = "abc"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}
  
