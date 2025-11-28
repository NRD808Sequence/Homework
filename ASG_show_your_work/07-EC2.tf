resource "aws_instance" "terraform-ec2" {
  ami           = "ami-0157af9aea2eef346" # us-east-1
  instance_type = "t3.micro"
  security_groups = [aws_security_group.tf-demo-sg.id]
  subnet_id = aws_subnet.public_a.id
  associate_public_ip_address = true
  


    user_data = file("user_data.sh")

    tags = {
    Name = "terraform-ec2"
    }
}