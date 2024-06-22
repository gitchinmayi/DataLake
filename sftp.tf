resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGED"

  tags = {
    Name = "SFTP-Server"
  }
}

resource "aws_transfer_user" "sftp_user" {
  user_name     = "agency-user"
  server_id     = aws_transfer_server.sftp_server.id
  role          = aws_iam_role.transfer_role.arn
  home_directory_type = "PATH"
  home_directory = "/${aws_s3_bucket.data_bucket.bucket}"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": ["${aws_s3_bucket.data_bucket.arn}/*"]
    }]
  })
}
