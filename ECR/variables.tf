variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "new-ecr-repo"
}

variable "ecr_region" {
  description = "Region of the ECR repository"
  type        = string
  default     = "us-east-1"
}