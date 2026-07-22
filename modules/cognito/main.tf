resource "aws_cognito_user_pool" "pool" {
  name = var.user_pool_name

  tags = merge(
    var.tags,
    {
      Terraform   = "true"
      Environment = var.environment
    }
  )
}

resource "aws_cognito_identity_provider" "google_provider" {
  user_pool_id  = aws_cognito_user_pool.pool.id
  provider_name = "Google"
  provider_type = "Google"

  provider_details = {
    authorize_scopes = "email"
    client_id        = var.google_client_id
    client_secret    = var.google_client_secret
  }

  attribute_mapping = {
    email    = "email"
    username = "sub"
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name         = "client"
  user_pool_id = aws_cognito_user_pool.pool.id

  callback_urls                        = var.callback_urls
  logout_urls                          = var.logout_urls
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["email", "openid", "profile"]
  supported_identity_providers         = ["Google"]

  depends_on = [aws_cognito_identity_provider.google_provider]
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = var.user_pool_domain
  user_pool_id = aws_cognito_user_pool.pool.id
}

