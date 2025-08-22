rg_name      = "rg-prod-aks"
location     = "eastus"

cluster_name = "aks-prod-core"
dns_prefix   = "aks-prod"

kubernetes_version  = "1.29.7"

system_node_count   = 1
system_node_vm_size = "Standard_D4s_v5"

user_node_count     = 1
user_node_vm_size   = "Standard_D4s_v5"

tags = {
  env = "prod"
}
