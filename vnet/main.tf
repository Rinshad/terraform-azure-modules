resource "azurerm_resource_group" "vnet_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  
  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? [""] : []

    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }
  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}