# XML Infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0, < 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 0.3, < 4.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 0.3, < 4.0 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asg_alarms"></a> [asg\_alarms](#module\_asg\_alarms) | git@github.com:companieshouse/terraform-modules//aws/asg-cloudwatch-alarms | tags/1.0.116 |
| <a name="module_bep_asg"></a> [bep\_asg](#module\_bep\_asg) | git@github.com:companieshouse/terraform-modules//aws/terraform-aws-autoscaling | tags/1.0.36 |
| <a name="module_bep_asg_alarms"></a> [bep\_asg\_alarms](#module\_bep\_asg\_alarms) | git@github.com:companieshouse/terraform-modules//aws/asg-cloudwatch-alarms | tags/1.0.116 |
| <a name="module_cloudwatch_sns_notifications"></a> [cloudwatch\_sns\_notifications](#module\_cloudwatch\_sns\_notifications) | terraform-aws-modules/sns/aws | 3.3.0 |
| <a name="module_cloudwatch_sns_ooh"></a> [cloudwatch\_sns\_ooh](#module\_cloudwatch\_sns\_ooh) | terraform-aws-modules/sns/aws | 3.3.0 |
| <a name="module_fe_asg"></a> [fe\_asg](#module\_fe\_asg) | git@github.com:companieshouse/terraform-modules//aws/terraform-aws-autoscaling | tags/1.0.36 |
| <a name="module_rds_start_stop_schedule"></a> [rds\_start\_stop\_schedule](#module\_rds\_start\_stop\_schedule) | git@github.com:companieshouse/terraform-modules//aws/rds_start_stop_schedule | tags/1.0.131 |
| <a name="module_xml_bep_asg_security_group"></a> [xml\_bep\_asg\_security\_group](#module\_xml\_bep\_asg\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_xml_bep_profile"></a> [xml\_bep\_profile](#module\_xml\_bep\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile | tags/1.0.59 |
| <a name="module_xml_external_alb"></a> [xml\_external\_alb](#module\_xml\_external\_alb) | terraform-aws-modules/alb/aws | ~> 5.0 |
| <a name="module_xml_external_alb_alarms"></a> [xml\_external\_alb\_alarms](#module\_xml\_external\_alb\_alarms) | git@github.com:companieshouse/terraform-modules//aws/alb-cloudwatch-alarms | tags/1.0.116 |
| <a name="module_xml_external_alb_security_group"></a> [xml\_external\_alb\_security\_group](#module\_xml\_external\_alb\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_xml_fe_asg_security_group"></a> [xml\_fe\_asg\_security\_group](#module\_xml\_fe\_asg\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_xml_fe_profile"></a> [xml\_fe\_profile](#module\_xml\_fe\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile | tags/1.0.59 |
| <a name="module_xml_internal_alb"></a> [xml\_internal\_alb](#module\_xml\_internal\_alb) | terraform-aws-modules/alb/aws | ~> 5.0 |
| <a name="module_xml_internal_alb_alarms"></a> [xml\_internal\_alb\_alarms](#module\_xml\_internal\_alb\_alarms) | git@github.com:companieshouse/terraform-modules//aws/alb-cloudwatch-alarms | tags/1.0.116 |
| <a name="module_xml_internal_alb_security_group"></a> [xml\_internal\_alb\_security\_group](#module\_xml\_internal\_alb\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_xml_rds"></a> [xml\_rds](#module\_xml\_rds) | terraform-aws-modules/rds/aws | 2.23.0 |
| <a name="module_xml_rds_security_group"></a> [xml\_rds\_security\_group](#module\_xml\_rds\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_schedule.bep-schedule-start](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.bep-schedule-stop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.fe-schedule-start](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.fe-schedule-stop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_cloudwatch_log_group.xml_bep](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.xml_fe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.ef_presenter_data_buckets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.ef_presenter_data_buckets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.xml_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route53_record.xml_alb_internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.xml_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_acm_certificate.acm_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_ami.bep_xml](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ami.fe_xml](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ef_presenter_data_bucket_live](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ef_presenter_data_bucket_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ef_presenter_data_buckets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_role.rds_enhanced_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) | data source |
| [aws_kms_key.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_security_group.nagios_shared](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_security_group.rds_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_security_group.rds_shared](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet.web_details](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet_ids.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [template_cloudinit_config.bep_userdata_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |
| [template_cloudinit_config.fe_userdata_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |
| [template_file.bep_userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.fe_userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [vault_generic_secret.account_ids](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.internal_cidrs](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.kms_keys](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.s3_releases](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.security_kms_keys](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.security_s3_buckets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.xml_bep_cron_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.xml_bep_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.xml_ec2_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.xml_fe_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.xml_fess_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.xml_rds_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | Short version of the name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The amount of storage in GB to launch RDS with | `number` | n/a | yes |
| <a name="input_application"></a> [application](#input\_application) | The name of the application | `string` | n/a | yes |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | True/False value to allow AWS to apply minor version updates to RDS without approval from owner | `bool` | n/a | yes |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | The name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The number of days to retain backups for - 0 to 35 | `number` | n/a | yes |
| <a name="input_bep_app_release_version"></a> [bep\_app\_release\_version](#input\_bep\_app\_release\_version) | Version of the application to download for deployment to backend server(s) | `string` | n/a | yes |
| <a name="input_bep_desired_capacity"></a> [bep\_desired\_capacity](#input\_bep\_desired\_capacity) | The desired capacity of ASG | `number` | n/a | yes |
| <a name="input_bep_instance_size"></a> [bep\_instance\_size](#input\_bep\_instance\_size) | The size of the ec2 instances to build | `string` | n/a | yes |
| <a name="input_bep_max_size"></a> [bep\_max\_size](#input\_bep\_max\_size) | The max size of the ASG | `number` | n/a | yes |
| <a name="input_bep_min_size"></a> [bep\_min\_size](#input\_bep\_min\_size) | The min size of the ASG | `number` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version provided by AWS RDS e.g. 12.1.0.2.v21 | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment | `string` | n/a | yes |
| <a name="input_fe_app_release_version"></a> [fe\_app\_release\_version](#input\_fe\_app\_release\_version) | Version of the application to download for deployment to frontend servers | `string` | n/a | yes |
| <a name="input_fe_desired_capacity"></a> [fe\_desired\_capacity](#input\_fe\_desired\_capacity) | The desired capacity of ASG | `number` | n/a | yes |
| <a name="input_fe_instance_size"></a> [fe\_instance\_size](#input\_fe\_instance\_size) | The size of the ec2 instances to build | `string` | n/a | yes |
| <a name="input_fe_max_size"></a> [fe\_max\_size](#input\_fe\_max\_size) | The max size of the ASG | `number` | n/a | yes |
| <a name="input_fe_min_size"></a> [fe\_min\_size](#input\_fe\_min\_size) | The min size of the ASG | `number` | n/a | yes |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | The license model for the engine, byol or license-include: https://aws.amazon.com/rds/oracle/faqs/ | `string` | n/a | yes |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | The major version of the database engine type e.g. 12.1 | `string` | n/a | yes |
| <a name="input_maximum_storage"></a> [maximum\_storage](#input\_maximum\_storage) | The maximum storage in GB to allow RDS to scale to | `number` | n/a | yes |
| <a name="input_parameter_group_settings"></a> [parameter\_group\_settings](#input\_parameter\_group\_settings) | A list of parameters that will be set in the RDS instance parameter group | `list(any)` | n/a | yes |
| <a name="input_rds_backup_window"></a> [rds\_backup\_window](#input\_rds\_backup\_window) | A backup window that allows AWS to backup your RDS instance e.g. `03:00-06:00` | `string` | n/a | yes |
| <a name="input_rds_maintenance_window"></a> [rds\_maintenance\_window](#input\_rds\_maintenance\_window) | A maintenance window that will allow AWS to run maintenance on underlying hosts e.g. `Mon:00:00-Mon:03:00` | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Short version of the name of the AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_vault_password"></a> [vault\_password](#input\_vault\_password) | Password for connecting to Vault - usually supplied through TF\_VARS | `string` | n/a | yes |
| <a name="input_vault_username"></a> [vault\_username](#input\_vault\_username) | Username for connecting to Vault - usually supplied through TF\_VARS | `string` | n/a | yes |
| <a name="input_bep_ami_name"></a> [bep\_ami\_name](#input\_bep\_ami\_name) | Name of the AMI to use in the Auto Scaling configuration for backend server(s) | `string` | `"xml-frontend-*"` | no |
| <a name="input_bep_cw_logs"></a> [bep\_cw\_logs](#input\_bep\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_bep_default_log_group_retention_in_days"></a> [bep\_default\_log\_group\_retention\_in\_days](#input\_bep\_default\_log\_group\_retention\_in\_days) | Total days to retain logs in CloudWatch log group if not specified for specific logs | `number` | `14` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain Name for ACM Certificate | `string` | `"*.companieshouse.gov.uk"` | no |
| <a name="input_enable_sns_topic"></a> [enable\_sns\_topic](#input\_enable\_sns\_topic) | A boolean value to alter deployment of an SNS topic for CloudWatch actions | `bool` | `false` | no |
| <a name="input_fe_ami_name"></a> [fe\_ami\_name](#input\_fe\_ami\_name) | Name of the AMI to use in the Auto Scaling configuration for frontend servers | `string` | `"xml-frontend-*"` | no |
| <a name="input_fe_cw_logs"></a> [fe\_cw\_logs](#input\_fe\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_fe_default_log_group_retention_in_days"></a> [fe\_default\_log\_group\_retention\_in\_days](#input\_fe\_default\_log\_group\_retention\_in\_days) | Total days to retain logs in CloudWatch log group if not specified for specific logs | `number` | `14` | no |
| <a name="input_fe_health_check_path"></a> [fe\_health\_check\_path](#input\_fe\_health\_check\_path) | Target group health check path | `string` | `"/"` | no |
| <a name="input_fe_service_port"></a> [fe\_service\_port](#input\_fe\_service\_port) | Target group backend port | `number` | `80` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The type of instance for the RDS | `string` | `"db.t3.medium"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Whether the RDS is Multi-AZ | `bool` | `false` | no |
| <a name="input_nfs_mount_destination_parent_dir"></a> [nfs\_mount\_destination\_parent\_dir](#input\_nfs\_mount\_destination\_parent\_dir) | The parent folder that all NFS shares should be mounted inside on the EC2 instance | `string` | `"/mnt"` | no |
| <a name="input_nfs_mounts"></a> [nfs\_mounts](#input\_nfs\_mounts) | A map of objects which contains mount details for each mount path required. | `map(any)` | <pre>{<br>  "SH_NFSTest": {<br>    "local_mount_point": "folder",<br>    "mount_options": [<br>      "rw",<br>      "wsize=8192"<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_nfs_server"></a> [nfs\_server](#input\_nfs\_server) | The name or IP of the environment specific NFS server | `string` | `null` | no |
| <a name="input_public_allow_cidr_blocks"></a> [public\_allow\_cidr\_blocks](#input\_public\_allow\_cidr\_blocks) | cidr block list for allowing inbound users from internet | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_public_cidr_block"></a> [public\_cidr\_block](#input\_public\_cidr\_block) | cidr block for allowing inbound users from internet | `string` | `"0.0.0.0/0"` | no |
| <a name="input_rds_ingress_groups"></a> [rds\_ingress\_groups](#input\_rds\_ingress\_groups) | A list of security group name patterns that will be allowed access to RDS | `list(string)` | `[]` | no |
| <a name="input_rds_log_exports"></a> [rds\_log\_exports](#input\_rds\_log\_exports) | A list log types to export from RDS to Cloudwatch | `list(string)` | `[]` | no |
| <a name="input_rds_onpremise_access"></a> [rds\_onpremise\_access](#input\_rds\_onpremise\_access) | A list of cidr ranges that will be allowed access to RDS | `list(any)` | `[]` | no |
| <a name="input_rds_schedule_enable"></a> [rds\_schedule\_enable](#input\_rds\_schedule\_enable) | Controls whether a start/stop schedule will be created for the RDS instance (true) or not (false) | `bool` | `false` | no |
| <a name="input_rds_start_schedule"></a> [rds\_start\_schedule](#input\_rds\_start\_schedule) | The SSM cron expression that defines when the RDS instance will be started | `string` | `""` | no |
| <a name="input_rds_stop_schedule"></a> [rds\_stop\_schedule](#input\_rds\_stop\_schedule) | The SSM cron expression that defines when the RDS instance will be stopped | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_address"></a> [rds\_address](#output\_rds\_address) | n/a |
| <a name="output_xml_frontend_address_internal"></a> [xml\_frontend\_address\_internal](#output\_xml\_frontend\_address\_internal) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->