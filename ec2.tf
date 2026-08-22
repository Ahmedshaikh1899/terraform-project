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
