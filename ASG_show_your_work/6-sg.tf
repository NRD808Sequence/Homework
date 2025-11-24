resource "aws_security_group" "tf-demo-sg" {
  name        = "tf-demo-sg"
  description = "Allow inbound traffic and all outbound traffic to my vpc"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "tf-demo-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "tf-demo-sg_ssh" {
  description       = "SSH from anywhere"
  security_group_id = aws_security_group.tf-demo-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

   tags = {
    Name = "SSH"
  }
}


resource "aws_vpc_security_group_egress_rule" "tf-demo-sg-egress-allow-all_ip4" {
  security_group_id = aws_security_group.tf-demo-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_ingress_rule" "tf-demo-sg_http" {
  description       = "http from anywhere"
  security_group_id = aws_security_group.tf-demo-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

   tags = {
    Name = "HTTP"
  }
}