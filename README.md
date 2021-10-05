# AWS CRON TO LAMBDA Terraform Module

A Terraform module to provision a time-based event rule to trigger a lambda function.

## Features

- [x] Cron trigger based on AWS CloudWatch Events

## Examples

Go to `./examples`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version   |
| ------------------------------------------------------------------------ | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.55.0 |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)          | 3.61.0  |
| <a name="provider_random"></a> [random](#provider_random) | 3.1.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                                    | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule)     | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_lambda_permission.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission)             | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)                                   | resource |

## Inputs

| Name                                                                                       | Description                      | Type                                                                                                   | Default | Required |
| ------------------------------------------------------------------------------------------ | -------------------------------- | ------------------------------------------------------------------------------------------------------ | ------- | :------: |
| <a name="input_event_rule_config"></a> [event_rule_config](#input_event_rule_config)       | Configuration of the event rule. | <pre>object({<br> name = string<br> description = string<br> schedule_expression = string<br> })</pre> | n/a     |   yes    |
| <a name="input_lambda_function_arn"></a> [lambda_function_arn](#input_lambda_function_arn) | ARN of the lambda function.      | `string`                                                                                               | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
