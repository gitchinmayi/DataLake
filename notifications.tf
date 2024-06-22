//CloudWatch Event Rule
resource "aws_cloudwatch_event_rule" "daily_check" {
  name                = "DailyCheck"
  description         = "Checks daily for missing uploads"
  schedule_expression = "cron(0 0 * * ? *)"
}

//SNS Topic for Alerts
resource "aws_sns_topic" "sftp_alerts" {
  name = "sftp-alerts"
}

// CloudWatch Event Target to SNS
resource "aws_cloudwatch_event_target" "notify_target" {
  rule = aws_cloudwatch_event_rule.daily_check.name
  arn  = aws_sns_topic.sftp_alerts.arn
}
