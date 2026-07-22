output "queue_url" {
  description = "URL da fila SQS principal (AWS_SQS_SERVICE_ORDER_QUEUE_URL)"
  value       = aws_sqs_queue.service_order_queue.url
}

output "queue_arn" {
  description = "ARN da fila SQS principal"
  value       = aws_sqs_queue.service_order_queue.arn
}

output "dlq_url" {
  description = "URL da Dead Letter Queue"
  value       = aws_sqs_queue.dlq.url
}

output "dlq_arn" {
  description = "ARN da Dead Letter Queue"
  value       = aws_sqs_queue.dlq.arn
}
