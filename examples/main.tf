module aks {
  source                         = "./.."
  resource_group_name            = var.resource_group_name
  cluster_prefix                 = var.cluster_prefix
  environment_name               = var.environment_name
  unique_id                      = var.unique_id
  aks_version                    = var.aks_version
  aks_client_id                  = var.aks_client_id
  aks_client_id_secret           = var.aks_client_id_secret
  aks_aad_client_id              = var.aks_aad_client_id
  aks_aad_server_id              = var.aks_aad_server_id
  aks_aad_server_id_secret       = var.aks_aad_server_id_secret
  enable_log_analytics_workspace = var.enable_log_analytics_workspace
  tags                           = var.tags
}
