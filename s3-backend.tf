terraform {
  backend "s3" {
    bucket       = "ahmed-devops-terraform-21082026"
    key          = "terraform/prod/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}