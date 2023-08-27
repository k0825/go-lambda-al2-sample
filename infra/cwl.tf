resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/go-lambda-sample"
  retention_in_days = 1
}
