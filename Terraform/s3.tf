# Check if the S3 bucket exists by attempting to create it conditionally
resource "aws_s3_bucket" "deepseek_bucket" {
  count  = var.create_s3_bucket ? 1 : 0
  bucket = "deepseek-model-data2"
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "deepseek_bucket_sse" {
  count  = var.create_s3_bucket ? 1 : 0
  bucket = aws_s3_bucket.deepseek_bucket[0].bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

