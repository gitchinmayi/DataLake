// Define IAM role for Lambda execution
resource "aws_iam_role" "lambda_exec" {
  name = "lambda-exec-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_lambda_function" "check_uploads" {
  filename      = "./lambda.zip"
  function_name = "check_sftp_uploads"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      BUCKET_NAME   = aws_s3_bucket.data_bucket.bucket
      SNS_TOPIC_ARN = aws_sns_topic.sftp_alerts.arn
    }
  }
}
