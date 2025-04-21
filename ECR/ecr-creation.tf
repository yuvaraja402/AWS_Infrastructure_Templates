module "ecr_private" {
  source          = "terraform-aws-modules/ecr/aws"
  version         = "2.4.0"
  repository_name = var.ecr_repo_name

  repository_read_write_access_arns = ["arn:aws:iam::012345678901:role/terraform"]
  
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}