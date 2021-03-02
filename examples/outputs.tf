output "aks_resource_group_id" {
  value = module.aks.aks_resource_group_id
}

output "aks_resource_group_name" {
  value = module.aks.aks_resource_group_name
}

output "aks_node_resource_group_name" {
  value = module.aks.aks_node_resource_group_name
}

output "aks_cluster_id" {
  value = module.aks.aks_cluster_id
}

output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "aks_cluster_fqdn" {
  value = module.aks.aks_cluster_fqdn
}

output "aks_cluster_version" {
  value = module.aks.aks_cluster_version
}

output "aks_cluster_location" {
  value = module.aks.aks_cluster_location
}

output "aks_cluster_outbound_ips" {
  value = module.aks.aks_cluster_outbound_ips
}

output "aks_cluster_aad_client_app_id" {
  value = module.aks.aks_cluster_aad_client_app_id
}

output "aks_cluster_aad_server_app_id" {
  value = module.aks.aks_cluster_aad_server_app_id
}

output "aks_cluster_aad_tenant_id" {
  value = module.aks.aks_cluster_aad_tenant_id
}

output "aks_cluster_client_id" {
  value = module.aks.aks_cluster_client_id
}

output "kube_admin_config_raw" {
  value     = module.aks.kube_admin_config_raw
  sensitive = true
}

output "public_ssh_key" {
  value = module.aks.public_ssh_key
}

output "private_ssh_key" {
  value     = module.aks.private_ssh_key
  sensitive = true
}
