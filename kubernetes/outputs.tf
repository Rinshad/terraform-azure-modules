output "cluster_name" {
  description = "The k8s cluster name."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "cluster_id" {
  description = "The k8s cluster ID."
  value       = azurerm_kubernetes_cluster.aks.id
}
