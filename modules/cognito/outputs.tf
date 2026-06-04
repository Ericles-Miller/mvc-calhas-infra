output "user_pool_id" {
  description = "ID do Cognito User Pool"
  value       = aws_cognito_user_pool.pool.id
}

output "user_pool_client_id" {
  description = "ID do cliente da aplicação no Cognito"
  value       = aws_cognito_user_pool_client.client.id
}

output "user_pool_client_secret" {
  description = "Secret do cliente da aplicação no Cognito"
  value       = aws_cognito_user_pool_client.client.client_secret
  sensitive   = true
}

output "cognito_domain" {
  description = "URL base do Cognito hosted UI"
  value       = "https://${aws_cognito_user_pool_domain.main.domain}.auth.${data.aws_region.current.name}.amazoncognito.com"
}

data "aws_region" "current" {}
