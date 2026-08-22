resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.lab_vpc_secgrp.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.lab_vpc_secgrp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.lab_vpc_secgrp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

###############APP SERVERS - SECURITY GROUP###########
resource "aws_vpc_security_group_ingress_rule" "allow_app_ipv4" {
  security_group_id = aws_security_group.app_vpc_secgrp.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_egress_rule" "allow_all_app_traffic_ipv4" {
  security_group_id = aws_security_group.app_vpc_secgrp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_app_traffic_ipv6" {
  security_group_id = aws_security_group.app_vpc_secgrp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

###############  DB SERVERS - SECURITY GROUP###########
resource "aws_vpc_security_group_ingress_rule" "allow_db_ipv4" {
  security_group_id = aws_security_group.db_vpc_secgrp.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_egress_rule" "allow_all_db_traffic_ipv4" {
  security_group_id = aws_security_group.app_vpc_secgrp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
