data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "random_id" "id" {
  byte_length = 2
}

locals {
  cluster_prefix = "${var.cluster_prefix}-${var.environment_name}-${random_id.id.hex}"
}

module "ssh_key" {
  source         = "./modules/ssh_key"
  public_ssh_key = var.public_ssh_key == "" ? "" : var.public_ssh_key
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = "${local.cluster_prefix}-aks"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  dns_prefix          = local.cluster_prefix
  kubernetes_version  = var.aks_version

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = replace(var.public_ssh_key == "" ? module.ssh_key.public_ssh_key : var.public_ssh_key, "\n", "")
    }
  }

  default_node_pool {
    name       = "pool${random_id.id.hex}"
    node_count = var.agent_count
    vm_size    = var.agent_size
  }

  service_principal {
    client_id     = var.aks_client_id
    client_secret = var.aks_client_id_secret
  }

  role_based_access_control {
    enabled = true

    azure_active_directory {
      client_app_id     = var.aks_aad_client_id
      server_app_id     = var.aks_aad_server_id
      server_app_secret = var.aks_aad_server_id_secret
    }
  }

  dynamic addon_profile {
    for_each = var.enable_log_analytics_workspace ? ["log_analytics"] : []
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
  count               = var.enable_log_analytics_workspace ? 1 : 0
  name                = "${local.cluster_prefix}-workspace"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "main" {
  count               = var.enable_log_analytics_workspace ? 1 : 0
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
