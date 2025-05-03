provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "my_rg" {
  name     = var.resource_group_name
  location = var.location
}
