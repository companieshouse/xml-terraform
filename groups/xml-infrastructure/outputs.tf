output "xml_frontend_address_internal" {
  value = aws_route53_record.xml_alb_internal.fqdn
}

output "rds_address" {
  value = aws_route53_record.xml_rds.fqdn
}
