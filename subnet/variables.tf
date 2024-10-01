variable "location" {
  description = "Azure location of the resources."
  type        = string
}

variable "name" {
  description = "Name of the subnet to create."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the vNet to place the subnet."
  type        = string
}

variable "address_prefixes" {
  description = "List of address prefixes to be used on the subnet."
  type        = list(string)
}

variable "private_endpoint_network_policies_enabled" {
  description = "If the private endpoint network policies are enabled."
  type        = bool
  default     = true
}

variable "private_link_service_network_policies_enabled" {
  description = "If the privae link services network policies are enabled."
  type        = bool
  default     = true
}

variable "default_security_group_name" {
  description = "Name of the default network security group attached to the subnet."
  type        = string
}

variable "default_security_group_security_rules" {
  description = "List of rules of the the default network security group attached to the subnet."
  type        = any
}

variable "tags" {
  description = "Tag of the subnet and the network security group attached to it."
  type        = map(string)
}

variable "delegation" {
  description = "Subnet service delegations"
  type        = any
  default     = null
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, and Microsoft.Web."
  type        = list(any)
  default     = []
}
