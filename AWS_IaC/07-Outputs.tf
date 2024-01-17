output "Web_Server_Public_IP" {
  value = aws_instance.WEB_Server.public_ip
}
