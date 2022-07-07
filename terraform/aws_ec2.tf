#------------------------
# EC2 instanceの作成
#------------------------
resource "aws_instance" "template_web_server" {
  ami                    = "ami-09d28faae2e9e7138" # Amazon Linux
  vpc_security_group_ids = [aws_security_group.template_sg.id]
  subnet_id              = aws_subnet.template_subnet.id
  key_name               = aws_key_pair.infrastracture_admin_keypair.id
  instance_type          = "t2.micro"

  user_data = <<EOF
#!/bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
EOF
}
