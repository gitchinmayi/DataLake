output "sftp_server_id" {
  value = aws_transfer_server.sftp_server.id
}

output "bucket_name" {
  value = aws_s3_bucket.data_bucket.bucket
}

output "sftp_user" {
  value = aws_transfer_user.sftp_user.user_name
}
