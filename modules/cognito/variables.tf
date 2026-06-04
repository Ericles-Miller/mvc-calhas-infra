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

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}