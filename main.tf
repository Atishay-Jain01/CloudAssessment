provider "azurerm" {
  features {}
  subscription_id = "de917971-3ca5-454f-9a61-16d7bab4eff2"
}

resource "azurerm_resource_group" "exam" {
  name     = "examResourceGroup"
  location = "East US"
}

resource "azurerm_virtual_network" "exam_vnet" {
  name                = "examVNet"
  location            = azurerm_resource_group.exam.location
  resource_group_name = azurerm_resource_group.exam.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "exam_subnet" {
  name                 = "examSubnet"
  resource_group_name  = azurerm_resource_group.exam.name
  virtual_network_name = azurerm_virtual_network.exam_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}