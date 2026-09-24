# terraform-aws-cloudwatch-log-group

Terraform module for a CloudWatch log group.

## Cost

CloudWatch Logs bills for data ingested and for data stored, based on
`retention_in_days`. An empty log group with no log events carries no
meaningful charge. See AWS's
[CloudWatch pricing](https://aws.amazon.com/cloudwatch/pricing/) page
for current rates.

## Usage

```hcl
module "log_group" {
  source = "kn47ytv9mv/cloudwatch-log-group/aws"

  name              = "/ecs/example"
  retention_in_days = 14
}
```

Or directly from this repository:

```hcl
module "log_group" {
  source = "github.com/kn47ytv9mv/terraform-aws-cloudwatch-log-group"

  name              = "/ecs/example"
  retention_in_days = 14
}
```

## Requirements

| Name | Version |
|---|---|
| terraform | >= 1.0 |
| aws | ~> 6.61 |
| random | ~> 3.9 |

## Providers

| Name | Version |
|---|---|
| aws | ~> 6.61 |
| random | ~> 3.9 |

## Inputs

| Name | Description | Default | Required |
|---|---|---|---|
| name | The name of the log group. If null, a unique name is generated. | `null` | no |
| kms_key_id | The ARN of the KMS key used to encrypt log data. If null, log data is encrypted with the default CloudWatch Logs encryption. | `null` | no |
| retention_in_days | Number of days to retain log events. If null, events never expire. | `null` | no |
| tags | A map of tags to assign to the log group. | `null` | no |

## Outputs

| Name | Description |
|---|---|
| id | The name of the log group. |
| arn | The ARN of the log group. |
| name | The name of the log group. Feed this into a consumer that targets a log group by name rather than ARN, such as terraform-aws-lambda-function's logging_config. |

## License

MIT — see [LICENSE.md](LICENSE.md).
