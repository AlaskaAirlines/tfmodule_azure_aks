terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.14"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 1.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 2.1"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
