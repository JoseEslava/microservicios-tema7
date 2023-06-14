# Initialises Terraform providers and sets their version numbers.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.51.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.21.1"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

# Configure Providers
provider "azurerm" {
  features {}

  subscription_id = ""
}

provider "tls" {
  # Configuration options
}

provider "kubernetes" {
    host = azurerm_kubernetes_cluster.cluster.kube_config[0].host

    client_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
}
