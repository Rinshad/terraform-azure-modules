resource "azurerm_subnet" "this" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  private_endpoint_network_policies_enabled     = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoints                             = var.service_endpoints
  dynamic "delegation" {
    for_each = var.delegation == null ? [] : [var.delegation]

    content {
      name = delegation.value["name"]

      dynamic "service_delegation" {
        for_each = [delegation.value["service_delegation"]]
        content {
          name    = service_delegation.value["name"]
          actions = service_delegation.value["actions"]
        }
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_network_security_group" "default" {
  name                = var.default_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}


resource "azurerm_network_security_rule" "this" {
  for_each                                   = { for rule in var.default_security_group_security_rules : rule.name => rule }
  name                                       = each.value.name
  description                                = try(each.value.description, null)
  priority                                   = try(each.value.priority, null)
  direction                                  = try(each.value.direction, null)
  access                                     = try(each.value.access, null)
  protocol                                   = try(each.value.protocol, null)
  source_port_range                          = try(each.value.source_port_range, null)
  source_port_ranges                         = try(each.value.source_port_ranges, null)
  destination_port_range                     = try(each.value.destination_port_range, null)
  destination_port_ranges                    = try(each.value.destination_port_ranges, null)
  source_address_prefix                      = try(each.value.source_address_prefix, null)
  source_address_prefixes                    = try(each.value.source_address_prefixes, null)
  destination_address_prefix                 = try(each.value.destination_address_prefix, null)
  destination_address_prefixes               = try(each.value.destination_address_prefixes, null)
  source_application_security_group_ids      = try(each.value.source_application_security_group_ids, null)
  destination_application_security_group_ids = try(each.value.destination_application_security_group_ids, null)
  resource_group_name                        = var.resource_group_name
  network_security_group_name                = azurerm_network_security_group.default.name
}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = azurerm_network_security_group.default.id

  lifecycle {
    prevent_destroy = true
  }
}

