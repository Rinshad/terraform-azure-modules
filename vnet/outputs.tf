output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}
output "resource_group_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}