provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "TerraformActivity5"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "Training"
    }
  }
}
