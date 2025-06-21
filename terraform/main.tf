resource "aws_security_group" "ass_15_sg1" {
  name        = "tf-sg1"
  description = "Allow SSH and HTTP access"
  vpc_id      = "vpc-03d8d03ff320b7f67"

  tags = {
    Name = "tf-sg1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ass_15_sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.ass_15_sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ass_15_sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}