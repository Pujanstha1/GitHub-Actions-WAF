variable "aws_region" {
  description = "AWS Region to deploy resources"
  type        = string
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "adex-terraform-9842463240"
}

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_public_access_block" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

