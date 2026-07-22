module "cognito" {
  source = "./modules/cognito"

  user_pool_name       = var.user_pool_name
  user_pool_domain     = var.user_pool_domain
  google_client_id     = var.google_client_id
  google_client_secret = var.google_client_secret
  callback_urls        = var.callback_urls
  logout_urls          = var.logout_urls
  environment          = var.environment
  tags                 = var.tags
}

module "s3" {
  source = "./modules/S3"

  s3_bucket_name = var.s3_bucket_name
  s3_tags        = var.s3_tags
}

module "sqs" {
  source = "./modules/SQS"

  queue_name        = var.sqs_queue_name
  dlq_name          = var.sqs_dlq_name
  max_receive_count = var.sqs_max_receive_count
  app_iam_user_name = module.s3.app_iam_user_name
  tags              = var.sqs_tags
}