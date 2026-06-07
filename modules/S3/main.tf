resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  tags = var.s3_tags
}

# Mantém o bucket privado por padrão, mas sem bloquear bucket policies,
# para que a policy abaixo consiga liberar leitura só em "avatar/*"
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

# Prefixo "avatar/*" igual ao usado em users.service.ts (`avatar/${fileName}`)
data "aws_iam_policy_document" "public_read_avatar" {
  statement {
    sid       = "PublicReadAvatar"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.s3_bucket.arn}/avatar/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "public_read_avatar" {
  bucket     = aws_s3_bucket.s3_bucket.id
  policy     = data.aws_iam_policy_document.public_read_avatar.json
  depends_on = [aws_s3_bucket_public_access_block.this]
}

# Permissões que o AwsS3Service precisa (upload/get/delete) em "avatar/*"
data "aws_iam_policy_document" "app_s3_access" {
  statement {
    sid       = "ListAvatarPrefix"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.s3_bucket.arn]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"
      values   = ["avatar/*"]
    }
  }

  statement {
    sid       = "ReadWriteAvatarObjects"
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["${aws_s3_bucket.s3_bucket.arn}/avatar/*"]
  }
}

resource "aws_iam_user" "app" {
  name = "${var.s3_bucket_name}-app"
  tags = var.s3_tags
}

resource "aws_iam_user_policy" "app_s3_access" {
  name   = "s3-avatar-access"
  user   = aws_iam_user.app.name
  policy = data.aws_iam_policy_document.app_s3_access.json
}

resource "aws_iam_access_key" "app" {
  user = aws_iam_user.app.name
}
