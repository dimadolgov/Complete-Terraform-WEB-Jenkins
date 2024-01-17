resource "tls_private_key" "tls" {
  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

resource "aws_s3_object" "tls_key_bucket_object" {
  key     = aws_instance.WEB_Server.id
  bucket  = aws_s3_bucket.nice_bucket.id
  content = tls_private_key.tls.private_key_pem

}
resource "aws_key_pair" "aws_key_pair" {
  key_name   = "SSH-NICE-KEY"
  public_key = tls_private_key.tls.public_key_openssh
}

variable "rsa_bits" {
  type    = number
  default = 4096
}
