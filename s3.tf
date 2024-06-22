resource "aws_s3_bucket" "data_bucket" {
  bucket = var.bucket_name
}
 
resource "aws_s3_bucket_versioning" "data_bucket_versioning" {
  bucket = aws_s3_bucket.data_bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}
