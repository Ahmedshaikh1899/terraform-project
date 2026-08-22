resource "aws_subnet" "demo_sub" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Main"

  }
}