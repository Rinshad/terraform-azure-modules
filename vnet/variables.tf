variable "resource_group_name" {
  description = "Name of the resource group where the VNet will be created"
  type        = string
}

variable "location" {
  description = "Location of the virtual network"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "ddos_protection_plan_id" {
  type        = string
  default     = null
  description = "The ID of DDoS Protection Plan."
}