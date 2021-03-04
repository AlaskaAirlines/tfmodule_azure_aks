variable "resource_group_name" {
  type        = string
  description = "Target Azure resource group in which to build the AKS cluster"
}

variable "cluster_prefix" {
  type        = string
  description = "Name describing the AKS cluster"
}

variable "environment_name" {
  type        = string
  description = "Environment level of the AKS cluster"
}

variable "unique_id" {
  type        = string
  description = "Unique identification string for AKS cluster resources"
  default     = ""
}

variable "aks_version" {
  type        = string
  description = "Kubernetes version of the AKS cluster"
}

variable "agent_count" {
  type        = number
  description = "Number of nodes to provision in the AKS node pool"
  default     = 1
}

variable "agent_size" {
  type        = string
  description = "Size of nodes to provision in the AKS node pool"
  default     = "Standard_DS2_v2"
}

variable "admin_username" {
  type        = string
  description = "Default username for AKS node pool agents"
  default     = "azureuser"
}

variable "public_ssh_key" {
  description = "SSH key for AKS node pool agents"
  default     = ""
}

variable "aks_client_id" {
  type        = string
  description = "Client ID of SPN that will run the AKS node pool resource group"
}

variable "aks_client_id_secret" {
  type        = string
  description = "Client secret of SPN that will run the AKS node pool resource group"
}

variable "aks_aad_client_id" {
  type        = string
  description = "Client ID of SPN that will act as the client to access Azure AD"
}

variable "aks_aad_server_id" {
  type        = string
  description = "Client ID of SPN that will act as the server to acquire data from Azure AD"
}

variable "aks_aad_server_id_secret" {
  type        = string
  description = "Client secret of SPN that will act as the server to acquire data from Azure AD"
}

variable "enable_log_analytics_workspace" {
  type        = bool
  description = "Enable a Log Analytics Workspace for the AKS cluster"
}

variable "log_analytics_workspace_sku" {
  type        = string
  description = "Specifies the SKU of the Log Analytics Workspace"
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  type        = number
  description = "Log Analytics Workspace data retention in days"
  default     = 30
}

variable "tags" {
  type    = map
  default = {}
}
