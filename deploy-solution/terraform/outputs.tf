output "namespace" {
  value = kubernetes_namespace.env.metadata[0].name
  description = "Namespace"
}

output "workspace_curent" {
  value       = terraform.workspace
  description = "deploy current workspece"
}
