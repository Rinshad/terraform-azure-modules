output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}
output "resource_group_name" {
  value = azurerm_resource_group.vnet_rg.name
}
