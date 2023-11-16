# Random resource
resource "random_pet" "this" {
  length = 2
}

# CW event rule
resource "aws_cloudwatch_event_rule" "this" {
  name                = "${var.event_rule_config.name}-rule-${random_pet.this.id}"
  description         = var.event_rule_config.description
  schedule_expression = var.event_rule_config.schedule_expression
}

# Set the target
resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = "${var.event_rule_config.name}-target-${random_pet.this.id}"
  arn       = var.lambda_function_arn
}

# Allow CW to invoke lambda
resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromCloudWatchFor${var.app}"
  action        = "lambda:InvokeFunction"
  function_name = reverse(split(":", var.lambda_function_arn))[0]
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this.arn
}
