output "instance_public_ip" {
  value = try(aws_instance.deepseekmodel.public_ip, "No public IP available")
}

output "alb_dns_name" {
  value = try(var.create_alb ? aws_lb.deepseek_alb[0].dns_name : "ALB not created", "ALB not created")
}

output "s3_bucket_name" {
  value = try(var.create_s3_bucket ? aws_s3_bucket.deepseek_bucket[0].id : "Bucket not created", "Bucket not created")
}