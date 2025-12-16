resource "aws_ssm_parameter" "parameters" {
  for_each = local.parameter_store_secrets

  name   = "${local.parameter_store_path_prefix}/${each.key}"
  type   = "SecureString"
  value  = each.value
  key_id = local.account_ssm_key_arn

  tags = merge(
      local.default_tags,
      {
        Name        = "${local.parameter_store_path_prefix}/${each.key}"
        
      }
    )
  }
