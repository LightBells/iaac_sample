#---------------------------------
# Security Groupの作成
#---------------------------------
resource "aws_security_group" "template_sg" {
  name   = "template-sg"
  vpc_id = aws_vpc.template_vpc.id
}


resource "aws_security_group_rule" "in_ssh" {
  security_group_id = aws_security_group.template_sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}


resource "aws_security_group_rule" "in_http" {
  security_group_id = aws_security_group.template_sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
}

# インバウンドルール(pingコマンド用)
resource "aws_security_group_rule" "in_icmp" {
  security_group_id = aws_security_group.template_sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
}

resource "aws_security_group_rule" "out_all" {
  security_group_id = aws_security_group.template_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}


#---------------------------------
# Key Pairの作成
#---------------------------------
resource "aws_key_pair" "infrastracture_admin_keypair" {
  key_name   = "infrastracture_admin"
  public_key = file("./infrastructure_admin_key.pub")
}
