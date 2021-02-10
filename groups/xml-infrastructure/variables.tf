# ------------------------------------------------------------------------------
# AWS Variables
# ------------------------------------------------------------------------------
variable "aws_region" {
  type        = string
  description = "The AWS region in which resources will be administered"
}

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use"
}

variable "aws_account" {
  type        = string
  description = "The name of the AWS Account in which resources will be administered"
}

# ------------------------------------------------------------------------------
# AWS Variables - Shorthand
# ------------------------------------------------------------------------------

variable "account" {
  type        = string
  description = "Short version of the name of the AWS Account in which resources will be administered"
}

variable "region" {
  type        = string
  description = "Short version of the name of the AWS region in which resources will be administered"
}

# ------------------------------------------------------------------------------
# Environment Variables
# ------------------------------------------------------------------------------

variable "application" {
  type        = string
  description = "The name of the application"
}

variable "environment" {
  type        = string
  description = "The name of the environment"
}

# ------------------------------------------------------------------------------
# RDS Variables
# ------------------------------------------------------------------------------
variable "instance_class" {
  type        = string
  description = "The type of instance for the RDS"
  default     = "db.t3.medium"
}

variable "multi_az" {
  type        = bool
  description = "Whether the RDS is Multi-AZ"
  default     = false
}

variable "backup_retention_period" {
  type        = number
  description = "The number of days to retain backups for - 0 to 35"
}

variable "allocated_storage" {
  type        = number
  description = "The amount of storage in GB to launch RDS with"
}

variable "maximum_storage" {
  type        = number
  description = "The maximum storage in GB to allow RDS to scale to"
}

variable "parameter_group_settings" {
  type        = list(any)
  description = "A list of parameters that will be set in the RDS instance parameter group"
}

variable "rds_onpremise_access" {
  type        = list(any)
  description = "A list of cidr ranges that will be allowed access to RDS"
  default     = []
}

variable "rds_log_exports" {
  type        = list(string)
  description = "A list log types to export from RDS to Cloudwatch"
  default     = []
}

variable "rds_maintenance_window" {
  type        = string
  description = "A maintenance window that will allow AWS to run maintenance on underlying hosts e.g. `Mon:00:00-Mon:03:00`"
}

variable "rds_backup_window" {
  type        = string
  description = "A backup window that allows AWS to backup your RDS instance e.g. `03:00-06:00`"
}

# ------------------------------------------------------------------------------
# RDS Engine Type Variables
# ------------------------------------------------------------------------------
variable "major_engine_version" {
  type        = string
  description = "The major version of the database engine type e.g. 12.1"
}
variable "engine_version" {
  type        = string
  description = "The engine version provided by AWS RDS e.g. 12.1.0.2.v21"
}
variable "license_model" {
  type        = string
  description = "The license model for the engine, byol or license-include: https://aws.amazon.com/rds/oracle/faqs/"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "True/False value to allow AWS to apply minor version updates to RDS without approval from owner"
}

# ------------------------------------------------------------------------------
# Vault Variables
# ------------------------------------------------------------------------------
variable "vault_username" {
  type        = string
  description = "Username for connecting to Vault - usually supplied through TF_VARS"
}

variable "vault_password" {
  type        = string
  description = "Password for connecting to Vault - usually supplied through TF_VARS"
}