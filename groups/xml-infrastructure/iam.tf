module "xml_fe_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59"

  name       = "xml-frontend-profile"
  enable_SSM = true
  cw_log_group_arns = length(local.fe_log_groups) > 0 ? [format(
    "arn:aws:logs:%s:%s:log-group:%s-fe-*:*",
    var.aws_region,
    data.aws_caller_identity.current.account_id,
    var.application
  )] : null
  s3_buckets_write  = [local.session_manager_bucket_name]
  instance_asg_arns = [module.fe_asg.this_autoscaling_group_arn]
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id,
    local.account_ssm_key_arn
  ]
  custom_statements = [
    {
      sid    = "AllowAccessToReleaseBucket",
      effect = "Allow",
      resources = [
        "arn:aws:s3:::shared-services.eu-west-2.releases.ch.gov.uk/*",
        "arn:aws:s3:::shared-services.eu-west-2.releases.ch.gov.uk",
        "arn:aws:s3:::shared-services.eu-west-2.configs.ch.gov.uk/*",
        "arn:aws:s3:::shared-services.eu-west-2.configs.ch.gov.uk"
      ],
      actions = [
        "s3:Get*",
        "s3:List*",
      ]
    },
    {
      sid       = "AllowReadOfParameterStore",
      effect    = "Allow",
      resources = ["arn:aws:ssm:${var.aws_region}:${data.aws_caller_identity.current.account_id}:parameter/${var.application}/${var.environment}/*"],
      actions = [
        "ssm:GetParameter*"
      ]
    }
  ]
}

module "xml_bep_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59"

  name       = "xml-backend-profile"
  enable_SSM = true
  cw_log_group_arns = length(local.bep_log_groups) > 0 ? [format(
    "arn:aws:logs:%s:%s:log-group:%s-bep-*:*",
    var.aws_region,
    data.aws_caller_identity.current.account_id,
    var.application
  )] : null
  s3_buckets_write  = [local.session_manager_bucket_name]
  instance_asg_arns = [module.bep_asg.this_autoscaling_group_arn]
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id,
    local.account_ssm_key_arn
  ]
  custom_statements = [
    {
      sid    = "AllowAccessToReleaseBucket",
      effect = "Allow",
      resources = [
        "arn:aws:s3:::shared-services.eu-west-2.releases.ch.gov.uk/*",
        "arn:aws:s3:::shared-services.eu-west-2.releases.ch.gov.uk",
        "arn:aws:s3:::shared-services.eu-west-2.configs.ch.gov.uk/*",
        "arn:aws:s3:::shared-services.eu-west-2.configs.ch.gov.uk"
      ],
      actions = [
        "s3:Get*",
        "s3:List*",
      ]
    },
    {
      sid       = "AllowReadOfParameterStore",
      effect    = "Allow",
      resources = ["arn:aws:ssm:${var.aws_region}:${data.aws_caller_identity.current.account_id}:parameter/${var.application}/${var.environment}/*"],
      actions = [
        "ssm:GetParameter*"
      ]
    }
  ]
}

resource "aws_iam_policy" "ef_presenter_data_import" {
  count = var.ef_presenter_data_import ? 1 : 0

  name   = "ef-presenter-data-import"
  policy = data.aws_iam_policy_document.ef_presenter_data_import[0].json
}

resource "aws_iam_role_policy_attachment" "ef_presenter_data_import" {
  count = var.ef_presenter_data_import ? 1 : 0

  role       = module.xml_bep_profile.aws_iam_role.name
  policy_arn = aws_iam_policy.ef_presenter_data_import[0].arn
}
