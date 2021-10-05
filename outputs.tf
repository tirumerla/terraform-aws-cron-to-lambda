output "aws_cloudwatch_event_rule_arn" {
  value       = aws_cloudwatch_event_rule.this.arn
  description = "ARN of the CloudWatch event rule."
}

output "aws_cloudwatch_event_rule_name" {
  value       = aws_cloudwatch_event_rule.this.name
  description = "Name of the CloudWatch event rule."
}