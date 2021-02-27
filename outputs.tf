output "aks_resource_group_id" {
  value       = data.azurerm_resource_group.main.id
  description = "description for output_name"
}

output "aks_resource_group_name" {
  value       = data.azurerm_resource_group.main.name
  description = "description for output_name"
}

output "aks_node_resource_group_name" {
  value       = azurerm_kubernetes_cluster.main.node_resource_group
  description = "description for output_name"
}

output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.main.id
  description = "description for output_name"
}

output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.main.name
  description = "description for output_name"
}

output "aks_cluster_fqdn" {
  value       = azurerm_kubernetes_cluster.main.fqdn
  description = "description for output_name"
}

output "aks_cluster_version" {
  value       = azurerm_kubernetes_cluster.main.kubernetes_version
  description = "description for output_name"
}

output "aks_cluster_location" {
  value       = azurerm_kubernetes_cluster.main.location
  description = "description for output_name"
}

output "aks_cluster_outbound_ips" {
  value       = azurerm_kubernetes_cluster.main.network_profile[0].load_balancer_profile[0].effective_outbound_ips
  description = "description for output_name"
}

output "aks_cluster_aad_client_app_id" {
  value       = azurerm_kubernetes_cluster.main.role_based_access_control[0].azure_active_directory[0].client_app_id
  description = "description for output_name"
}

output "aks_cluster_aad_server_app_id" {
  value       = azurerm_kubernetes_cluster.main.role_based_access_control[0].azure_active_directory[0].server_app_id
  description = "description for output_name"
}

output "aks_cluster_aad_tenant_id" {
  value       = azurerm_kubernetes_cluster.main.role_based_access_control[0].azure_active_directory[0].tenant_id
  description = "description for output_name"
}

output "aks_cluster_client_id" {
  value       = azurerm_kubernetes_cluster.main.service_principal[0].client_id
  description = "description for output_name"
}

output "public_ssh_key" {
  value       = module.ssh-key.public_ssh_key
  description = "description for output_name"
}

output "private_ssh_key_filename" {
  value       = module.ssh-key.private_ssh_key_filename
  description = "description for output_name"
}
