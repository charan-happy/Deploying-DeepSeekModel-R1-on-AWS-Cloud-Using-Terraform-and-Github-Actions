
# Attempt to check for existing S3 bucket, handle errors gracefully  
data "aws_s3_bucket" "existing_bucket" {  
  bucket = "deepseek-model-data2" // Replace with your bucket name  
}  

locals {  
  existing_bucket_id = try(data.aws_s3_bucket.existing_bucket.id, "") // Use try to handle missing bucket errors  
}  

# S3 Bucket creation logic  
resource "aws_s3_bucket" "deepseek_bucket" {  
  count  = local.existing_bucket_id == "" ? 1 : 0  
  bucket = "deepseek-model-data2"  
  acl    = "private"  
}  

resource "aws_s3_bucket_server_side_encryption_configuration" "deepseek_bucket_sse" {  
  count  = aws_s3_bucket.deepseek_bucket[0].id != "" ? 1 : 0 // Apply if the bucket exists  
  bucket = aws_s3_bucket.deepseek_bucket[0].id  

  rule {  
    apply_server_side_encryption_by_default {  
      sse_algorithm = "AES256"  
    }  
  }  
}