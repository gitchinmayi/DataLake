resource "aws_iam_role" "transfer_role" {
  name               = "TransferRole"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "transfer.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "transfer_policy" {
  name   = "TransferPolicy"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "${aws_s3_bucket.data_bucket.arn}",
        "${aws_s3_bucket.data_bucket.arn}/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "transfer_attachment" {
  role       = aws_iam_role.transfer_role.name
  policy_arn = aws_iam_policy.transfer_policy.arn
}
