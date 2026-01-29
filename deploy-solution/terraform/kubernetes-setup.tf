
resource "kubernetes_namespace" "env" {
  metadata {
    name = "${var.app_name}-${terraform.workspace}"
  }
}

resource "helm_release" "contapics_app" {
  name       = "contapics-app"
  chart      = "../contapics-app"
  namespace  = kubernetes_namespace.env.metadata[0].name

  # --- DATABASE (Security & Storage) ---
  set {
    name  = "database.password"
    value = var.db_password
  }
  set {
    name  = "database.persistence.storage"
    value = terraform.workspace == "prod" ? var.db_storage_prod : var.db_storage_dev
  }

  # --- BACKEND (Images & Scaling) ---
  set {
    name  = "backend.image"
    value = var.backend_image
  }
  set {
    name  = "backend.tag"
    value = var.app_version
  }
  set {
    name  = "backend.replicas"
    value = terraform.workspace == "prod" ? 3 : 1
  }
  set {
    name  = "backend.resources.limits.memory"
    value = terraform.workspace == "prod" ? "1024Mi" : "512Mi"
  }

  # --- OCR SERVICE ---
  set {
    name  = "ocr.image"
    value = var.ocr_image
  }
  set {
    name  = "ocr.tag"
    value = var.app_version
  }

  # --- FRONTEND (Images & Backend Link) ---
  set {
    name  = "frontend.image"
    value = var.frontend_image
  }
  set {
    name  = "frontend.tag"
    value =  var.app_version
  }
  set {
    name  = "frontend.backendUrl"
    value = "http://${terraform.workspace}.myapp.local/api"
  }

  set {
    name  = "backend.env.corsOrigin"
    value = "http://${terraform.workspace}.myapp.local"
  }
  # --- INGRESS (Dynamic Host) ---
  set {
    name  = "ingress.host"
    value = "${terraform.workspace}.myapp.local"
  }

  set {
    name  = "ingress.minioHost"
    value = "minio-${terraform.workspace}.myapp.local"
  }

  set {
    name  = "minio.rootPassword"
    value = var.minio_password
  }

  set {
    name  = "ocr.replicas"
    value = terraform.workspace == "prod" ? 2 : 1
  }

  cleanup_on_fail = true
  atomic          = true
  wait            = true
}
