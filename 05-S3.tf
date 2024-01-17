resource "aws_s3_bucket" "nice_bucket" {
  bucket = "nice-exam-s3-bucket" # Change this to a globally unique bucket name
  tags = {
    Name = "S3_${var.project_name}"
  }
}
