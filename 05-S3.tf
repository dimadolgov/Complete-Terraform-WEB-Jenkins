resource "aws_s3_bucket" "NICE_bucket" {
  bucket = "your-unique-bucket-name" # Change this to a globally unique bucket name
  tags = {
    Name = "S3_${var.project_name}"
  }
}
