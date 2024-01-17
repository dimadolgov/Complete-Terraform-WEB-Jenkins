output "Public_Key_For_Jenkins" {
  value = tls_private_key.tls.public_key_pem
}

output "Web_Server_Public_IP" {
  value = aws_instance.WEB_Server.public_ip
}
