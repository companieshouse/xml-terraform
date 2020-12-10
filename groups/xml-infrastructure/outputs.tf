output "rds_address" {
  value = aws_route53_record.xml_rds.fqdn
}

output "rds_endpoint" {
  value = module.xml_rds.this_db_instance_address
}

output "rds_database_name" {
  value = module.xml_rds.this_db_instance_name
}