variable "aws_region" {
  default = "us-west-2"
}

variable "ami_id" {
  default = "ami-00c257e12d6828491" # replace with your ami id 
}

variable "instance_type" {
  default = "t2.large" #GPU instance type
}

variable "key_pair_name" {
  default = "deepseek-key"
}

variable "vpc_id" {
  default = "vpc-072176796ee4e7bb8"
  
  description = "The VPC ID for the ALB Target Group"
  type        = string

}

variable "public_subnets" {
  default = ["subnet-078242d0d26a51ce9", "subnet-0525ade82fe64df93"]
  description = "List of public subnets for the ALB"
  type        = list(string)
}
variable "create_s3_bucket" {
  description = "Whether to create the S3 bucket"
  type        = bool
  default     = true
}

variable "create_alb" {
  description = "Whether to create the ALB and related resources"
  type        = bool
  default     = true
}


