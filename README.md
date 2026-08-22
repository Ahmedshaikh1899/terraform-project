# AWS Infrastructure Automation with Terraform

## Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision and manage AWS infrastructure.

The infrastructure includes:

- AWS VPC
- Subnets
- EC2 instances
- Role-based Security Groups
- Ingress/Egress rules
- S3 Remote Terraform State
- State Locking
- Variable-driven infrastructure
- Dynamic EC2 provisioning using `for_each`

## Architecture

                    AWS
                     │
                  VPC
               10.0.0.0/16
                     │
                  Subnet
               10.0.1.0/24
                     │
          ┌──────────┴──────────┐
          │                     │
      Web Servers          App Servers
      web01/web02           appsrv01
          │                     │
       Web SG                 App SG
Technologies
Terraform
AWS EC2
AWS VPC
AWS Security Groups
Amazon S3
Git / GitHub
Project Structure
terraform/
├── backend.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── subnet.tf
├── security-grp.tf
├── secgrpallow.tf
├── ec2.tf
└── README.md
Key Terraform Implementation
Dynamic EC2 Provisioning

EC2 instances are created dynamically using for_each.

resource "aws_instance" "servers" {
  for_each = var.servers

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = aws_subnet.demo_sub.id

  vpc_security_group_ids = [
    local.security_groups[each.value.security_group]
  ]

  tags = {
    Name        = each.key
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
Variable Driven Configuration

Server configuration is maintained in terraform.tfvars.

servers = {
  web01 = {
    ami            = "ami-XXXXXXXX"
    instance_type  = "t3.micro"
    security_group = "web"
  }

  web02 = {
    ami            = "ami-XXXXXXXX"
    instance_type  = "t3.micro"
    security_group = "web"
  }

  appsrv01 = {
    ami            = "ami-XXXXXXXX"
    instance_type  = "t3.micro"
    security_group = "app"
  }
}

This allows new servers to be added without modifying the main EC2 resource.

Remote State

Terraform state is stored remotely in an Amazon S3 bucket.

Terraform
    │
    ▼
Amazon S3
    │
    └── terraform/dev/terraform.tfstate

Remote state provides centralized state management and state locking for safe Terraform operations.

Terraform Workflow
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
Key Concepts Demonstrated
Infrastructure as Code
Terraform variables and complex types
for_each
Resource dependencies
Dynamic security-group assignment
AWS networking
EC2 provisioning
Security Group management
Remote Terraform state
State locking
Resource tagging
Future Enhancements
Terraform modules
Dev/UAT/Prod environments
Application Load Balancer
Auto Scaling
RDS
Jenkins/GitHub Actions CI/CD
Automated Terraform plan and apply


Author - Ahmed Shaikh

Infrastructure / VMware Administrator | DevOps & Cloud

Technologies: Terraform | AWS | Git | Linux | CI/CD

