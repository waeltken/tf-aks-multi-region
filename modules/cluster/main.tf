locals {
  location           = var.location
  aks_version_prefix = "1.24"
}

resource "azurerm_resource_group" "default" {
  name     = "aks-${local.location}-rg"
  location = local.location
}

data "azurerm_kubernetes_service_versions" "current" {
  location       = azurerm_resource_group.default.location
  version_prefix = local.aks_version_prefix
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "aks-${local.location}"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "aks-crossplane${local.location}"

  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B4ms"
  }

  identity {
    type = "SystemAssigned"
  }
}
