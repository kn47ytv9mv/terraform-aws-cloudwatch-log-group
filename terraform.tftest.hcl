mock_provider "aws" {}

run "name_defaults_to_random_uuid" {
  command = apply

  assert {
    condition     = aws_cloudwatch_log_group.resource.name == random_uuid.resource.id
    error_message = "Leaving name unset should fall back to the generated random_uuid."
  }
}

run "explicit_name_overrides_random_uuid" {
  command = plan

  variables {
    name = "/ecs/example"
  }

  assert {
    condition     = aws_cloudwatch_log_group.resource.name == "/ecs/example"
    error_message = "An explicit name should override the random_uuid fallback."
  }
}

run "retention_in_days_defaults_to_never_expire" {
  command = plan

  assert {
    condition     = aws_cloudwatch_log_group.resource.retention_in_days == null
    error_message = "Leaving retention_in_days unset should mean events never expire (AWS's own default), not some finite default."
  }
}

run "readme_default_example" {
  command = plan

  variables {
    name              = "/ecs/example"
    retention_in_days = 14
  }

  assert {
    condition     = aws_cloudwatch_log_group.resource.retention_in_days == 14
    error_message = "retention_in_days should pass through to the resource."
  }
}
