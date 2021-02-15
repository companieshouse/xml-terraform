data "aws_vpc" "vpc" {
  tags = {
    Name = "vpc-${var.aws_account}"
  }
}

data "aws_subnet_ids" "data" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["sub-data-*"]
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["sub-public-*"]
  }
}

data "aws_subnet_ids" "web" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["sub-web-*"]
  }
}

data "aws_security_group" "rds_shared" {
  filter {
    name   = "group-name"
    values = ["sgr-rds-shared-001*"]
  }
}

data "aws_route53_zone" "private_zone" {
  name         = local.internal_fqdn
  private_zone = true
}

data "aws_iam_role" "rds_enhanced_monitoring" {
  name = "irol-rds-enhanced-monitoring"
}

data "aws_kms_key" "rds" {
  key_id = "alias/kms-rds"
}

data "vault_generic_secret" "account_ids" {
  path = "aws-accounts/account-ids"
}

data "vault_generic_secret" "s3_releases" {
  path = "aws-accounts/shared-services/s3"
}

data "vault_generic_secret" "internal_cidrs" {
  path = "aws-accounts/network/internal_cidr_ranges"
}

data "vault_generic_secret" "xml_rds" {
  path = "applications/${var.aws_profile}/${var.application}/rds"
}

data "vault_generic_secret" "xml_ec2_data" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/ec2"
}

data "vault_generic_secret" "xml_frontend_data" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/frontend"
}

data "aws_acm_certificate" "acm_cert" {
  domain = var.domain_name
}

data "aws_ami" "xml" {
  owners      = [data.vault_generic_secret.account_ids.data["development"]]
  most_recent = var.frontend_ami_name == "xml-frontend-*" ? true : false

  filter {
    name = "name"
    values = [
      var.frontend_ami_name,
    ]
  }

  filter {
    name = "state"
    values = [
      "available",
    ]
  }
}
