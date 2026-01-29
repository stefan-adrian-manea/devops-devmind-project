output "namespace" {
  value = kubernetes_namespace.env.metadata[0].name
  description = "Namespace"
}

output "app_url" {
  value = "http://${terraform.workspace}.myapp.local"
  description = "App URL"
}

output "workspace_curent" {
  value       = terraform.workspace
  description = "deploy current workspece"
}

data "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name      = "contapics-app-ingress" 
    namespace = kubernetes_namespace.env.metadata[0].name
  }
  depends_on = [helm_release.contapics_app]
}

output "url_acces" {
  value = "http://${data.kubernetes_ingress_v1.app_ingress.spec[0].rule[0].host}"
   description = "URL Ingress Status"
}


output "minio_url" {
  value = "http://minio-${terraform.workspace}.myapp.local"
  description = "MinIO Consol"
}