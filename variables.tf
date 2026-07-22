variable "environment" {
  type        = string
  description = "Ambiente (dev, prod)"
  default     = "dev"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile a ser usado"
  default     = "ericles-dev"
}

variable "aws_region" {
  type        = string
  description = "Região AWS"
  default     = "us-east-1"
}


# ==================================================
# TAGS GLOBAIS
# ==================================================

variable "project_tags" {
  type        = map(string)
  description = "Tags comuns para todos os recursos"
  default = {
    Project = "Challenge-IAC"
  }
}

# ==================================================
# VARIÁVEIS DO MÓDULO COGNITO
# ==================================================
variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
}

variable "google_client_id" {
  description = "Google Client ID for Cognito Identity Provider"
  type        = string
  sensitive   = true
}

variable "google_client_secret" {
  description = "Google Client Secret for Cognito Identity Provider"
  type        = string
  sensitive   = true
}

variable "callback_urls" {
  description = "List of allowed callback URLs for the Cognito User Pool Client"
  type        = list(string)
}

variable "logout_urls" {
  description = "List of allowed logout URLs for the Cognito User Pool Client"
  type        = list(string)
}

variable "user_pool_domain" {
  description = "Domain for the Cognito User Pool"
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

# ==================================================
# VARIÁVEIS DO MÓDULO S3
# ==================================================
variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}

variable "s3_tags" {
  description = "Map of tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}

# ==================================================
# VARIÁVEIS DO MÓDULO SQS
# ==================================================
variable "sqs_queue_name" {
  description = "Nome da fila SQS de OS (service orders)"
  type        = string
}

variable "sqs_dlq_name" {
  description = "Nome da Dead Letter Queue da fila de OS"
  type        = string
}

variable "sqs_max_receive_count" {
  description = "Quantidade de tentativas antes de mover a mensagem para a DLQ"
  type        = number
  default     = 5
}

variable "sqs_tags" {
  description = "Map of tags to apply to the SQS resources"
  type        = map(string)
  default     = {}
}
