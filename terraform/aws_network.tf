#---------------------------------
# VPCの作成
#---------------------------------
resource "aws_vpc" "template_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}


#---------------------------------
# Subnetの作成
#---------------------------------
resource "aws_subnet" "template_subnet" {
  vpc_id                  = aws_vpc.template_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
}


#---------------------------------
# Internet Gatewayの作成
#---------------------------------
resource "aws_internet_gateway" "template_igw" {
  vpc_id = aws_vpc.template_vpc.id
}


#---------------------------------
# rotue tableの作成
#---------------------------------
resource "aws_route_table" "template_rtb" {
  vpc_id = aws_vpc.template_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.template_igw.id
  }
}


#---------------------------------
# Route Tableをバインドする
#---------------------------------
resource "aws_route_table_association" "template_rt_assoc" {
  subnet_id      = aws_subnet.template_subnet.id
  route_table_id = aws_route_table.template_rtb.id
}


#---------------------------------
# Elastic IPの作成
#---------------------------------
resource "aws_eip" "template_eip" {
  instance = aws_instance.template_web_server.id
  vpc      = true
}
