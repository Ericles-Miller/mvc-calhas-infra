output "cognito_user_pool_id" {
  description = "ID do Cognito User Pool"
  value       = module.cognito.user_pool_id
}

output "cognito_user_pool_client_id" {
  description = "ID do cliente da aplicação no Cognito"
  value       = module.cognito.user_pool_client_id
}

output "cognito_user_pool_client_secret" {
  description = "Secret do cliente da aplicação no Cognito"
  value       = module.cognito.user_pool_client_secret
  sensitive   = true
}

output "cognito_domain" {
  description = "URL base do Cognito hosted UI"
  value       = module.cognito.cognito_domain
}
