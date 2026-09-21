resource "azurerm_resource_group" "rg" { name = var.resource_group_name location = var.location }
resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "public" { name="snet-public" resource_group_name=azurerm_resource_group.rg.name virtual_network_name=azurerm_virtual_network.vnet.name address_prefixes=["10.0.1.0/24"] }
resource "azurerm_subnet" "app" { name="snet-app" resource_group_name=azurerm_resource_group.rg.name virtual_network_name=azurerm_virtual_network.vnet.name address_prefixes=["10.0.2.0/24"] }
resource "azurerm_subnet" "private" { name="snet-private" resource_group_name=azurerm_resource_group.rg.name virtual_network_name=azurerm_virtual_network.vnet.name address_prefixes=["10.0.3.0/24"] }
