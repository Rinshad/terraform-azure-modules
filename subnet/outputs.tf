output "subnet_name" {
  description = "The subnet name."
  value       = azurerm_subnet.this.name
}

output "subnet_id" {
  description = "The subnet ID."
  value       = azurerm_subnet.this.id
}

output "address_prefixes" {
  description = "The subnet Prefixes."
  value       = azurerm_subnet.this.address_prefixes
}
