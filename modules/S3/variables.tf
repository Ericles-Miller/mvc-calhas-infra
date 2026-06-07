variable "s3_bucket_name" {
  description = "Nome do bucket S3 (deve ser único globalmente)"
  type        = string
}

variable "s3_tags" {
  description = "Tags para os recursos do S3"
  type        = map(string)
  default     = {}
}

