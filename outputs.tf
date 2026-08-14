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

output "s3_bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = module.s3.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN do bucket S3 criado"
  value       = module.s3.bucket_arn
}

output "s3_app_access_key_id" {
  description = "Access Key ID do usuário IAM da aplicação"
  value       = module.s3.app_access_key_id
}

output "s3_app_secret_access_key" {
  description = "Secret Access Key do usuário IAM da aplicação"
  value       = module.s3.app_secret_access_key
  sensitive   = true
}

output "sqs_queue_url" {
  description = "URL da fila SQS de OS (AWS_SQS_SERVICE_ORDER_QUEUE_URL)"
  value       = module.sqs.queue_url
}

output "sqs_queue_arn" {
  description = "ARN da fila SQS de OS"
  value       = module.sqs.queue_arn
}

output "sqs_dlq_url" {
  description = "URL da DLQ da fila de OS"
  value       = module.sqs.dlq_url
}

output "sqs_dlq_arn" {
  description = "ARN da DLQ da fila de OS"
  value       = module.sqs.dlq_arn
}

output "sqs_evaluation_queue_url" {
  description = "URL da fila SQS de alertas de avaliação (AWS_SQS_EVALUATION_QUEUE_URL)"
  value       = module.sqs_evaluation.queue_url
}

output "sqs_evaluation_queue_arn" {
  description = "ARN da fila SQS de alertas de avaliação"
  value       = module.sqs_evaluation.queue_arn
}

output "sqs_evaluation_dlq_url" {
  description = "URL da DLQ da fila de alertas de avaliação"
  value       = module.sqs_evaluation.dlq_url
}

output "sqs_evaluation_dlq_arn" {
  description = "ARN da DLQ da fila de alertas de avaliação"
  value       = module.sqs_evaluation.dlq_arn
}
