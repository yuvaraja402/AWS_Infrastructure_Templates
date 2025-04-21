module "ecr_registry_config" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "2.4.0"

  create_repository = false # We're only managing the registry, not the repository

  # Enable Accoutn-wide scanning across all ECR repositories
  manage_registry_scanning_configuration = true
  registry_scan_type                     = "ENHANCED"
  registry_scan_rules = [
    {
      scan_frequency = "SCAN_ON_PUSH" # Options: SCAN_ON_PUSH or CONTINUOUS_SCAN
      filter = [
        {
          filter      = "*"
          filter_type = "WILDCARD"
        }
      ]
    }
  ]

  # Enable replication across multiple regions (future-proof for scaling)
  create_registry_replication_configuration = false
  registry_replication_rules = [
    {
      destinations = [
        {
          region      = "us-west-2"    # Example region 1
          registry_id = "012345678901" # Replace with your AWS account ID
        },
        {
          region      = "eu-west-1"    # Example region 2
          registry_id = "012345678901" # Replace with your AWS account ID
        }
      ]
      repository_filters = [
        {
          filter      = "*"
          filter_type = "WILDCARD"
        }
      ]
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}
