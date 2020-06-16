module aks {
  source                         = "./.."
  resource_group_name            = var.resource_group_name
  team_name                      = var.team_name
  environment_level              = var.environment_level
  agents_count                   = var.agents_count
  agents_size                    = var.agents_size
  aks_client_id                  = var.aks_client_id
  aks_client_id_secret           = var.aks_client_id_secret
  aks_aad_client_id              = var.aks_aad_client_id
  aks_aad_server_id              = var.aks_aad_server_id
  aks_aad_server_id_secret       = var.aks_aad_server_id_secret
  public_ssh_key                 = var.public_ssh_key
  enable_log_analytics_workspace = var.enable_log_analytics_workspace
  log_analytics_workspace_sku    = var.log_analytics_workspace_sku
  log_retention_in_days          = var.log_retention_in_days
  tags                           = var.tags
}
