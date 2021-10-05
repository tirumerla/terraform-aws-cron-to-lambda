provider "aws" {
    region = "eu-central-1"
    shared_credentials_file = "/Users/olivergoetz/.aws/credentials"
    profile = "terraform"
}

data "aws_caller_identity" "this" {}

resource "aws_lambda_function" "this" {
    filename = "${path.module}/sample.zip"
    function_name = "my-lambda-${data.aws_caller_identity.this.account_id}"
    role          = aws_iam_role.iam_for_lambda.arn
    handler       = "sample.handler"
    runtime = "python3.9"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

module "cw-rule" {
    source = "../"
    lambda_function_arn= aws_lambda_function.this.arn
    event_rule_config = {
        name = "scale-up-asg"
        description = "Invoke a lambda to scale an ASG"
        schedule_expression = "cron(0/15 * * * ? *)"
    }
}


