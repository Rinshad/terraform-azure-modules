output "cluster_name" {
  description = "The k8s cluster name."
  value       = azurerm_kubernetes_cluster.this.name
}

output "cluster_id" {
  description = "The k8s cluster ID."
  value       = azurerm_kubernetes_cluster.this.id
}

output "aks_api" {
  description = "The k8s cluster API hostname."
  value       = azurerm_private_dns_a_record.aks_endpoint.fqdn
}
