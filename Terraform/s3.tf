data "aws_s3_bucket" "existing_bucket" {  
  bucket = "deepseek-model-data2"  
}  

resource "aws_s3_bucket" "deepseek_bucket" {  
  count  = data.aws_s3_bucket.existing_bucket.id == 0 ? 1 : 0
  bucket = "deepseek-model-data2"  
  acl    = "private"  
}  

resource "aws_s3_bucket_server_side_encryption_configuration" "deepseek_bucket_sse" {  
  count = aws_s3_bucket.deepseek_bucket[*].id == [] ? 0 : 1  # Only create if the bucket exists  

  bucket = aws_s3_bucket.deepseek_bucket[0].id  

  rule {  
    apply_server_side_encryption_by_default {  
      sse_algorithm = "AES256"  
    }  
  }  
}