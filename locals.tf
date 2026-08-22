locals {
  security_groups = {
    web = aws_security_group.lab_vpc_secgrp.id
    app = aws_security_group.app_vpc_secgrp.id
    db = aws_security_group.db_vpc_secgrp.id
  }
}
