terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }
  required_version = ">= 0.13"
}

variable "public_ssh_key" {
  description = "An ssh key set in the main variables of the terraform-azurerm-aks module"
  default     = ""
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

output "public_ssh_key" {
  # Only output a generated ssh public key
  value = var.public_ssh_key != "" ? "" : tls_private_key.ssh.public_key_openssh
}

output "private_ssh_key" {
  # Only output a generated ssh public key
  value     = var.public_ssh_key != "" ? "" : tls_private_key.ssh.private_key_pem
  sensitive = true
}
