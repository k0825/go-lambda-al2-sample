resource "aws_lambda_function" "lambda" {
  function_name    = "go-lambda-sample"
  filename         = "./lambda/archive/bootstrap.zip"
  role             = aws_iam_role.lambda_role.arn
  handler          = "sample"
  runtime          = "provided.al2"
  source_code_hash = data.archive_file.lambda.output_base64sha256
}

resource "null_resource" "default" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "cd ./lambda/cmd/ && GOOS=linux GOARCH=amd64 go build -o ../build/main main.go"
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./lambda/build/main"
  output_path = "./lambda/archive/main.zip"

  depends_on = [null_resource.default]
}
