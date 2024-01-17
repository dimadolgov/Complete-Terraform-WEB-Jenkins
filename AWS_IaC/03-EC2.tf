############################### EC2 Instance + Template file ###############################
resource "aws_instance" "WEB_Server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "SSH-NICE-KEY"
  subnet_id                   = aws_subnet.public_subnet.id
  user_data                   = templatefile("template.tpl", {})
  vpc_security_group_ids      = [aws_security_group.NICE_security_group.id]
  associate_public_ip_address = true
  tags = {
    Name = "WEB_Server_${var.project_name}"
  }
}
