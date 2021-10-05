variable "event_rule_config" {
  type        = object({
      name = string
      description = string
      schedule_expression = string
  })

  description = "Configuration of the event rule."
}

variable "lambda_function_arn" {
  type = string
  description = "ARN of the lambda function."
}
