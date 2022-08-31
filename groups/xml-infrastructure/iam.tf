module "xml_fe_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59"

  name       = "xml-frontend-profile"
  enable_SSM = true
  cw_log_group_arns = length(local.fe_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.fe_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.fe_log_groups
    ),
  ]) : null
  s3_buckets_write  = [local.session_manager_bucket_name]
  instance_asg_arns = [module.fe_asg.this_autoscaling_group_arn]
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
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
    }
  ]
}

module "xml_bep_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59"

  name       = "xml-backend-profile"
  enable_SSM = true
  cw_log_group_arns = length(local.bep_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.bep_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.bep_log_groups
    ),
  ]) : null
  s3_buckets_write  = [local.session_manager_bucket_name]
  instance_asg_arns = [module.bep_asg.this_autoscaling_group_arn]
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
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
    }
  ]
}

data "aws_iam_policy_document" "ef_presenter_data_bucket_live" {
  count = var.environment == "live" ? 1 : 0

  statement {
    sid = "AllowAccessToLiveEFPresenterDataBucket"

    actions = [
      "s3:Get*",
      "s3:List*",
    ]

    resources = [
      "arn:aws:s3:::ef-presenter-data.fil.tuxedo.heritage-live.ch.gov.uk/*",
      "arn:aws:s3:::ef-presenter-data.fil.tuxedo.heritage-live.ch.gov.uk"
    ]
  }

  statement {
    sid = "AllowDecryptionUsingLiveEFPresenterDataKMSKey"

    actions = [
      "kms:Decrypt",
    ]

    resources = [
      "arn:aws:kms:*:${data.vault_generic_secret.account_ids.data["heritage-live"]}:key/*"
    ]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "kms:ResourceAliases"

      values = [
        "alias/fil-tuxedo-live",
      ]
    }
  }
}

data "aws_iam_policy_document" "ef_presenter_data_bucket_staging" {
  count = var.environment == "live" ? 1 : 0

  statement {
    sid = "AllowAccessToStagingEFPresenterDataBucket"

    actions = [
      "s3:Get*",
      "s3:List*",
    ]

    resources = [
      "arn:aws:s3:::ef-presenter-data.fil.tuxedo.heritage-staging.ch.gov.uk/*",
      "arn:aws:s3:::ef-presenter-data.fil.tuxedo.heritage-staging.ch.gov.uk"
    ]
  }

  statement {
    sid = "AllowDecryptionUsingStagingEFPresenterDataKMSKey"

    actions = [
      "kms:Decrypt",
    ]

    resources = [
      "arn:aws:kms:*:${data.vault_generic_secret.account_ids.data["heritage-staging"]}:key/*"
    ]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "kms:ResourceAliases"

      values = [
        "alias/fil-tuxedo-staging",
      ]
    }
  }
}

data "aws_iam_policy_document" "ef_presenter_data_buckets" {
  count = var.environment == "live" ? 1 : 0

  source_policy_documents = [
    data.aws_iam_policy_document.ef_presenter_data_bucket_live[0].json,
    data.aws_iam_policy_document.ef_presenter_data_bucket_staging[0].json
  ]
}

resource "aws_iam_policy" "ef_presenter_data_buckets" {
  count = var.environment == "live" ? 1 : 0

  name   = "ef-presenter-data-buckets"
  policy = data.aws_iam_policy_document.ef_presenter_data_buckets[0].json
}

resource "aws_iam_role_policy_attachment" "ef_presenter_data_buckets" {
  count = var.environment == "live" ? 1 : 0

  role       = module.xml_bep_profile.aws_iam_role.arn
  policy_arn = aws_iam_policy.ef_presenter_data_buckets[0].arn
}
