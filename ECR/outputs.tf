output "repository_name" {
  description = "Name of the ECR repository"
  value       = module.ecr_private.repository_name
}

output "repository_region" {
  description = "Region of the ECR repository"
  value       = var.ecr_region
}

output "repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr_private.repository_url
}

output "repository_arn" {
  description = "ARN of the ECR repository"
  value       = module.ecr_private.repository_arn
}
