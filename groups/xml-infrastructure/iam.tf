module "xml_frontend_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.31"

  name = "xml_frontend_profile"
  statement = [
    {
      sid    = "xmlloggroupwrite"
      effect = "Allow"
      resources = [
        aws_cloudwatch_log_group.xml_fe.arn
      ]
      actions = [
        "logs:CreateLogStream",
        "logs:PutLogEvents",
      ]
    },
    {
      sid    = "AllowAccessToReleaseBucket",
      effect = "Allow",
      resources = [
        "arn:aws:s3:::shared-services.eu-west-2.releases.ch.gov.uk/*",
        "arn:aws:s3:::shared-services.eu-west-2.releases.ch.gov.uk"
      ],
      actions = [
        "s3:Get*",
        "s3:List*",
      ]
    }
  ]
}