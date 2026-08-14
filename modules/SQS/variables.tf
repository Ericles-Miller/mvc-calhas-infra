variable "queue_name" {
  description = "Nome da fila SQS principal"
  type        = string
}

variable "dlq_name" {
  description = "Nome da Dead Letter Queue (DLQ)"
  type        = string
}

variable "max_receive_count" {
  description = "Quantidade de tentativas antes de mover a mensagem para a DLQ"
  type        = number
  default     = 5
}

variable "visibility_timeout_seconds" {
  description = "Tempo (s) que uma mensagem fica invisível após ser recebida por um consumer"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "Tempo (s) de retenção das mensagens na fila principal"
  type        = number
  default     = 345600 # 4 dias
}

variable "dlq_message_retention_seconds" {
  description = "Tempo (s) de retenção das mensagens na DLQ"
  type        = number
  default     = 1209600 # 14 dias (máximo), para dar tempo de investigar falhas
}

variable "app_iam_user_name" {
  description = "Nome do usuário IAM da aplicação (o mesmo usado para S3), que também precisa de acesso à fila"
  type        = string
}

variable "policy_name" {
  description = "Nome da IAM user policy de acesso à fila. Precisa ser único por usuário IAM — se o módulo for instanciado mais de uma vez para o mesmo app_iam_user_name, cada instância precisa de um valor diferente."
  type        = string
  default     = "sqs-service-order-access"
}

variable "tags" {
  description = "Tags para os recursos do SQS"
  type        = map(string)
  default     = {}
}
