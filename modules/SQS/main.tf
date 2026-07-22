resource "aws_sqs_queue" "dlq" {
  name                      = var.dlq_name
  message_retention_seconds = var.dlq_message_retention_seconds

  tags = var.tags
}

resource "aws_sqs_queue" "service_order_queue" {
  name                       = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = var.tags
}

# Permite que a DLQ receba mensagens redirecionadas pela fila principal
resource "aws_sqs_queue_redrive_allow_policy" "dlq" {
  queue_url = aws_sqs_queue.dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue"
    sourceQueueArns   = [aws_sqs_queue.service_order_queue.arn]
  })
}

# Permissões que a app precisa: publicar (create) e consumir (consumer básico)
data "aws_iam_policy_document" "app_sqs_access" {
  statement {
    sid       = "PublishServiceOrderQueue"
    effect    = "Allow"
    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.service_order_queue.arn]
  }

  statement {
    sid       = "ConsumeServiceOrderQueue"
    effect    = "Allow"
    actions   = ["sqs:ReceiveMessage", "sqs:DeleteMessage", "sqs:GetQueueAttributes"]
    resources = [aws_sqs_queue.service_order_queue.arn]
  }
}

resource "aws_iam_user_policy" "app_sqs_access" {
  name   = "sqs-service-order-access"
  user   = var.app_iam_user_name
  policy = data.aws_iam_policy_document.app_sqs_access.json
}
