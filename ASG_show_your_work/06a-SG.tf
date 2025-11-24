resource "aws_security_group" "tf-demo-sg-lb" {
  name        = "tf-demo-sg-lb"
  description = "Allow inbound traffic and all outbound traffic to my vpc"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "tf-demo-sg-lb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "tf-demo-sg-lb_http" {
  description       = "http from anywhere"
  security_group_id = aws_security_group.tf-demo-sg-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

   tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_egress_rule" "tf-demo-sg-lb-egress-allow-all_ip4" {
  security_group_id = aws_security_group.tf-demo-sg-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}