resource "aws_vpc" "main" {
  cidr_block       = "10.88.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "terraform-vpc"
    Service = "vpc"
    Owner = "Chewbacca"
    Planet = "Yavin-1"
  
  }
}