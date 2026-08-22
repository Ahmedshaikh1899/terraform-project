resource "aws_security_group" "lab_vpc_secgrp" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.lab_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "app_vpc_secgrp" {
  name        = "allow_app"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.lab_vpc.id

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_security_group" "db_vpc_secgrp" {
  name        = "allow_dbsrv"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.lab_vpc.id

  tags = {
    Name = "allow_dbsrv_tls"
  }
}
