variable "app_name" {
  description = "Numele de baza al aplicatiei"
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

variable "backend_image" {
  type    = string
  default = "devops-contapics-backend:latest"
}

variable "frontend_image" {
  type    = string
  default = "devops-contapics-frontend:latest"
}