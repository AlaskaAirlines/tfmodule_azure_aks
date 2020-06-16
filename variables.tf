variable "resource_group_name" {
  type        = string
  description = "This is the AKS cluster target Azure Resource Group"
  default     = ""
}

variable "team_name" {
  type        = string
  description = "This is your Alaska Airlines team name"
  default     = ""
}

variable "environment_level" {
  type        = string
  description = "This is the AKS cluster environment level"
  default     = ""
}

variable "agents_count" {
  default = ""
}

variable "agents_size" {
  default = ""
}

variable "aks_client_id" {
  type        = string
  description = "This is the client id of the SPN that will run the AKS node resource group"
  default     = ""
}

variable "aks_client_id_secret" {
  type        = string
  description = "This is the client secret of the SPN that will run the AKS node resource group"
  default     = ""
}

variable "aks_aad_client_id" {
  type        = string
  description = "This is the client id of the SPN that will act as a client to access the azure AAD for the underlying subscription"
  default     = ""
}

variable "aks_aad_server_id" {
  type        = string
  description = "This is the client id of the SPN that will act as a server to acquire data from the azure AAD for the underlying subscription"
  default     = ""
}

variable "aks_aad_server_id_secret" {
  type        = string
  description = "This is the client id of the SPN that will act as a server to acquire data from the azure AAD for the underlying subscription"
  default     = ""
}

variable "public_ssh_key" {
  default = ""
}

variable "enable_log_analytics_workspace" {
  default = ""
}

variable "log_analytics_workspace_sku" {
  default = ""
}

variable "log_retention_in_days" {
  default = ""
}

variable "tags" {
  default = ""
}
