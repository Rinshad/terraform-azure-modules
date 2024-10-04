variable "location" {
  description = "Azure location of the resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "name" {
  description = "Name of the subnet to create."
  type        = string
}

variable "azure_policy_enabled" {
  type        = bool
  description = "Enable Azure Policy Addon."
  default     = true
}

variable "disk_encryption_set_id" {
  type        = string
  description = "(Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created."
  default     = null
}

variable "http_application_routing_enabled" {
  type        = bool
  description = "Enable HTTP Application Routing Addon (forces recreation)."
  default     = false
}

variable "kubernetes_version" {
  type        = string
  description = "Specify which Kubernetes release to use. The default used is the latest Kubernetes version available in the region"
  default     = "1.25.6"
}

variable "local_account_disabled" {
  type        = bool
  description = "(Optional) - If `true` local accounts will be disabled. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information."
  default     = null
}

variable "node_resource_group" {
  type        = string
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. Changing this forces a new resource to be created."
  default     = null
}

variable "oidc_issuer_enabled" {
  description = "Enable or Disable the OIDC issuer URL. Defaults to false."
  type        = bool
  default     = false
}

variable "private_cluster_enabled" {
  type        = bool
  description = "If true cluster API server will be exposed only on internal IP address and available only in"
  default     = true
  validation {
    condition     = can(regex("^(true)$", var.private_cluster_enabled))
    error_message = "The cluster should be always private."
  }
}

variable "private_cluster_public_fqdn_enabled" {
  type        = bool
  description = "(Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to `false`."
  default     = false
}

variable "private_dns_zone_id" {
  type        = string
  description = "(Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, `System` to have AKS manage this or `None`. In case of `None` you will need to bring your own DNS server and set up resolving, otherwise cluster will have issues after provisioning. Changing this forces a new resource to be created."
  default     = null
}

variable "role_based_access_control_enabled" {
  type        = bool
  description = "Enable Role Based Access Control."
  default     = false
  nullable    = false
}

variable "sku_tier" {
  type        = string
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid"
  default     = "Free"
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the AKS cluster resources"
  default     = {}
}

variable "agents_pool_name" {
  type        = string
  description = "The default Azure AKS agentpool (nodepool) name."
  default     = "defaultpool"
  nullable    = false
}

variable "agents_size" {
  type        = string
  description = "The default virtual machine size for the Kubernetes agents"
  default     = "Standard_D2s_v3"
}

variable "temporary_name_for_rotation" {
  type        = string
  description = "Specifies the name of the temporary node pool used to cycle the default node pool for VM resizing."
  default     = "tempopool"
}

variable "enable_node_public_ip" {
  type        = bool
  description = "(Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false."
  default     = false
}

variable "agents_max_pods" {
  type        = number
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  default     = null
}

variable "agents_count" {
  type        = number
  description = "The number of Agents that should exist in the Agent Pool. Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes."
  default     = 2
}

variable "agents_labels" {
  type        = map(string)
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created."
  default     = {}
}

variable "only_critical_addons_enabled" {
  type        = bool
  description = "(Optional) Enabling this option will taint default node pool with `CriticalAddonsOnly=true:NoSchedule` taint. Changing this forces a new resource to be created."
  default     = null
}

variable "orchestrator_version" {
  type        = string
  description = "Specify which Kubernetes release to use for the orchestration layer. The default used is the latest Kubernetes version available in the region"
  default     = null
}

variable "os_disk_size_gb" {
  type        = number
  description = "Disk size of nodes in GBs."
  default     = null
}

variable "os_disk_type" {
  type        = string
  description = "The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this forces a new resource to be created."
  default     = null
}

variable "agents_tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the Node Pool."
  default     = {}
}

variable "agents_type" {
  type        = string
  description = "(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  default     = "VirtualMachineScaleSets"
}

variable "ultra_ssd_enabled" {
  type        = bool
  description = "(Optional) Used to specify whether the UltraSSD is enabled in the Default Node Pool. Defaults to false."
  default     = false
}

variable "vnet_subnet_id" {
  type        = string
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  default     = null
}

variable "agents_availability_zones" {
  type        = list(string)
  description = "(Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created."
  default     = null
}
variable "agents_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
  default     = null
}
variable "agents_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
  default     = null
}
variable "upgarde_max_surge" {
  description = "The maximum number or percentage of nodes which will be added to the Node Pool size during an upgrade."
  type        = number
  default     = 1
}

variable "network_plugin" {
  type        = string
  description = "Network plugin to use for networking."
  default     = "kubenet"
  nullable    = false
}

variable "net_profile_dns_service_ip" {
  type        = string
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
  default     = null
}

variable "network_policy" {
  type        = string
  description = " (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created."
  default     = "calico"
}

variable "net_profile_outbound_type" {
  type        = string
  description = "(Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer."
  default     = "loadBalancer"
}

variable "net_profile_pod_cidr" {
  type        = string
  description = " (Optional) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created."
  default     = null
}

variable "net_profile_service_cidr" {
  type        = string
  description = "(Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created."
  default     = null
}

variable "authorized_ip_ranges" {
  type        = set(string)
  description = "(Optional) The IP ranges to allow for incoming traffic to the server nodes."
  default     = null
}
