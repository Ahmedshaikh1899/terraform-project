aws_region  = "us-east-1"
vpc_cidr    = "10.0.0.0/16"
subnet_cidr = "10.0.1.0/24"

servers = {

  web01 = {
    ami            = "ami-07a5b367e8dc8bd92"
    instance_type  = "t3.micro"
    security_group = "web"
  }
  web02 = {
    ami            = "ami-0b6d9d3d33ba97d99"
    instance_type  = "t3.micro"
    security_group = "web"
  }
  appsrv01 = {
    ami            = "ami-02b3d83d84b07786d"
    instance_type  = "t3.micro"
    security_group = "app"
  }
}