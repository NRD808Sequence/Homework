resource "aws_launch_template" "main-LT" {
  name_prefix   = "main-LT"
  image_id      = "ami-0157af9aea2eef346"  
  instance_type = "t3.micro"

#   key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.tf-demo-sg.id]

  user_data = base64encode("user_data.sh")
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "main-LT"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}