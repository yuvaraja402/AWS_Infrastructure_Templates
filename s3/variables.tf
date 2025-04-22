variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "new-s3-bucket"
}

variable "s3_region" {
  description = "Region of the S3 bucket"
  type        = string
  default     = "us-east-1"
}