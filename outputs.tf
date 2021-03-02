output "aks_resource_group_id" {
  value       = data.azurerm_resource_group.main.id
  description = "Azure resource group ID of the AKS cluster"
}

output "aks_resource_group_name" {
  value       = data.azurerm_resource_group.main.name
  description = "Azure resource group name of the AKS cluster"
}

output "aks_node_resource_group_name" {
  value       = azurerm_kubernetes_cluster.main.node_resource_group
  description = "Azure resource group name of the AKS node pool"
}

output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.main.id
  description = ""
}

output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.main.name
  description = ""
}

output "aks_cluster_fqdn" {
  value       = azurerm_kubernetes_cluster.main.fqdn
  description = ""
}

output "aks_cluster_version" {
  value       = azurerm_kubernetes_cluster.main.kubernetes_version
  description = ""
}

output "aks_cluster_location" {
  value       = azurerm_kubernetes_cluster.main.location
  description = ""
}

output "aks_cluster_outbound_ips" {
  value       = azurerm_kubernetes_cluster.main.network_profile[0].load_balancer_profile[0].effective_outbound_ips
  description = ""
}

output "aks_cluster_aad_client_app_id" {
  value       = azurerm_kubernetes_cluster.main.role_based_access_control[0].azure_active_directory[0].client_app_id
  description = ""
}

output "aks_cluster_aad_server_app_id" {
  value       = azurerm_kubernetes_cluster.main.role_based_access_control[0].azure_active_directory[0].server_app_id
  description = ""
}

output "aks_cluster_aad_tenant_id" {
  value       = azurerm_kubernetes_cluster.main.role_based_access_control[0].azure_active_directory[0].tenant_id
  description = ""
}

output "aks_cluster_client_id" {
  value       = azurerm_kubernetes_cluster.main.service_principal[0].client_id
  description = ""
}

output "kube_admin_config_raw" {
  value     = azurerm_kubernetes_cluster.main.kube_admin_config_raw
  sensitive = true
}

output "public_ssh_key" {
  value       = module.ssh_key.public_ssh_key
  description = ""
}

output "private_ssh_key" {
  value       = module.ssh_key.private_ssh_key
  description = ""
  sensitive   = true
}
