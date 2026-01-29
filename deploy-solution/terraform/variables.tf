variable "app_name" {
  description = "App name"
  type        = string
  default     = "contapics"
}

variable "db_storage_dev" {
  default     = "1Gi"
}

variable "db_storage_prod" {
  default     = "5Gi"
}

variable "db_password" {
  type      = string
  sensitive = true
  default   = "init1234"
}

variable "minio_password" {
  type      = string
  sensitive = true
  default   = "minioadmin123"
}

variable "backend_image" {
  type    = string
  default = "devops-contapics-backend"
}

variable "frontend_image" {
  type    = string
  default = "devops-contapics-frontend"
}

variable "ocr_image" { 
  type    = string
  default = "devops-contapics-ocr"
}

variable "app_version" {
  description = "images tag / app version"
  type        = string
  default     = "v1.0.0"
}