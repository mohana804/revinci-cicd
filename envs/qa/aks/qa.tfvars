rg_name      = "rg-qa-aks"
location     = "eastus"
cluster_name = "aks-qa-core"
dns_prefix   = "aks-qa"
kubernetes_version  = "1.29.7"
system_node_count   = 1
system_node_vm_size = "Standard_D4s_v5"
user_node_count     = 1
user_node_vm_size   = "Standard_D4s_v5"
tags = { env = "qa" }
