output "bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.s3_bucket.bucket
}

output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "app_access_key_id" {
  description = "Access Key ID do usuário IAM da aplicação (AWS_ACCESS_KEY_ID)"
  value       = aws_iam_access_key.app.id
}

output "app_secret_access_key" {
  description = "Secret Access Key do usuário IAM da aplicação (AWS_SECRET_ACCESS_KEY)"
  value       = aws_iam_access_key.app.secret
  sensitive   = true
}

output "app_iam_user_name" {
  description = "Nome do usuário IAM da aplicação, usado para anexar policies de outros módulos (ex: SQS)"
  value       = aws_iam_user.app.name
}
