# Creates a managed Kubernetes cluster on Azure.

resource "azurerm_kubernetes_cluster" "cluster" {
    name                = var.app_name
    location            = var.location
    resource_group_name = azurerm_resource_group.flixtube.name
    dns_prefix          = var.app_name
    kubernetes_version  = "1.26.0"

    linux_profile {
        admin_username = var.admin_username

        ssh_key {
            key_data = "${trimspace(tls_private_key.key.public_key_openssh)} ${var.admin_username}@azure.com"
        }
    }

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_B2s"
    }

    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }
}

output "cluster_client_key" {
  sensitive = true
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].client_key
}

output "cluster_client_certificate" {
  sensitive = true
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate
}

output "cluster_cluster_ca_certificate" {
  sensitive = true
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate
}

output "cluster_cluster_username" {
  sensitive = true
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].username
}

output "cluster_cluster_password" {
  sensitive = true
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].password
}

output "cluster_kube_config" {
  sensitive = true
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

output "cluster_host" {
  sensitive = true
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].host
}