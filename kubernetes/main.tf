resource "azurerm_kubernetes_cluster" "aks" {
  name                                = var.name
  location                            = var.location
  resource_group_name                 = var.resource_group_name
  dns_prefix                          = var.name
  api_server_authorized_ip_ranges     = var.api_server_authorized_ip_ranges
  azure_policy_enabled                = var.azure_policy_enabled
  disk_encryption_set_id              = var.disk_encryption_set_id
  http_application_routing_enabled    = var.http_application_routing_enabled
  kubernetes_version                  = var.kubernetes_version
  local_account_disabled              = var.local_account_disabled
  node_resource_group                 = var.node_resource_group
  oidc_issuer_enabled                 = var.oidc_issuer_enabled
  open_service_mesh_enabled           = var.open_service_mesh_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  role_based_access_control_enabled   = var.role_based_access_control_enabled
  sku_tier                            = var.sku_tier
  tags                                = var.tags



    default_node_pool {
    name                         = var.agents_pool_name
    vm_size                      = var.agents_size
    enable_auto_scaling          = var.enable_auto_scaling
    enable_host_encryption       = var.enable_host_encryption
    temporary_name_for_rotation  = var.temporary_name_for_rotation
    enable_node_public_ip        = var.enable_node_public_ip
    max_count                    = var.enable_auto_scaling ? var.agents_max_count : null
    max_pods                     = var.agents_max_pods
    min_count                    = var.enable_auto_scaling ? var.agents_min_count : null
    node_count                   = var.agents_count
    node_labels                  = var.agents_labels
    only_critical_addons_enabled = var.only_critical_addons_enabled
    orchestrator_version         = var.orchestrator_version
    os_disk_size_gb              = var.os_disk_size_gb
    os_disk_type                 = var.os_disk_type
    tags                         = merge(var.tags, var.agents_tags)
    type                         = var.agents_type
    ultra_ssd_enabled            = var.ultra_ssd_enabled
    vnet_subnet_id               = var.vnet_subnet_id
    zones                        = var.agents_availability_zones
    upgrade_settings {
      max_surge = var.upgarde_max_surge
    }
}

  identity {
    type = "SystemAssigned"
  }

 network_profile {
    network_plugin     = var.network_plugin
    dns_service_ip     = var.net_profile_dns_service_ip
    docker_bridge_cidr = var.net_profile_docker_bridge_cidr
    network_policy     = var.network_policy
    outbound_type      = var.net_profile_outbound_type
    pod_cidr           = var.net_profile_pod_cidr
    service_cidr       = var.net_profile_service_cidr
  }
}
