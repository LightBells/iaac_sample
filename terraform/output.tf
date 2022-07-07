#---------------------------------
# Output
#---------------------------------
output "public_ip" {
  value = aws_eip.template_eip.public_ip
}
