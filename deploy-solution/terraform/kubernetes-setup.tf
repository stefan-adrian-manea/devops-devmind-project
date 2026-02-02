
resource "kubernetes_namespace" "env" {
  metadata {
    name = "${var.app_name}-${terraform.workspace}"
  }
}