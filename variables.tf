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