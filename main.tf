provider "azurerm" {
  features {
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "random_id" "prefix" {
  byte_length = 2
}

locals {
  cluster_name = "${var.team_name}-${var.environment_level}-${random_id.prefix.hex}"
}

module "ssh-key" {
  source         = "./modules/ssh-key"
  public_ssh_key = var.public_ssh_key == "" ? "" : var.public_ssh_key
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = "${local.cluster_name}-aks"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  dns_prefix          = local.cluster_name

  default_node_pool {
    name       = "nodepool${random_id.prefix.hex}"
    node_count = var.agents_count
    vm_size    = var.agents_size
  }

  identity {
    type = "SystemAssigned"
  }

  # service_principal {
  #   client_id     = var.aks_client_id
  #   client_secret = var.aks_client_id_secret
  # }

  role_based_access_control {
    enabled = false

    # azure_active_directory {
    #   client_app_id     = var.aks_aad_client_id
    #   server_app_id     = var.aks_aad_server_id
    #   server_app_secret = var.aks_aad_server_id_secret
    # }
  }

  dynamic addon_profile {
    for_each = "${var.enable_log_analytics_workspace}" ? ["log_analytics"] : []
    content {
      oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.main[0].id
      }
    }
  }

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "main" {
  count               = "${var.enable_log_analytics_workspace}" ? 1 : 0
  name                = "${local.cluster_name}-workspace"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "main" {
  count               = "${var.enable_log_analytics_workspace}" ? 1 : 0
  solution_name       = "ContainerInsights"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = var.resource_group_name

  workspace_resource_id = azurerm_log_analytics_workspace.main[0].id
  workspace_name        = azurerm_log_analytics_workspace.main[0].name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
