provider "aws" {
  version                     = "~> 2.67"
  region                      = "eu-west-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 14
  allow_users_to_change_password = false
  password_reuse_prevention      = 24
  require_numbers                = true
  require_symbols                = true
  require_lowercase_characters   = true
  require_uppercase_characters   = true
}

resource "aws_s3_bucket" "insecure-bucket" {
  bucket = "insecure-bucket"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}


