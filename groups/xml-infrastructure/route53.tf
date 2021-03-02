resource "aws_route53_record" "xml_rds" {
  zone_id = data.aws_route53_zone.private_zone.zone_id
  name    = "${var.application}db"
  type    = "CNAME"
  ttl     = "300"
  records = [module.xml_rds.this_db_instance_address]
}

resource "aws_route53_record" "xml_alb_internal" {
  zone_id = data.aws_route53_zone.private_zone.zone_id
  name    = "xmlgw"
  type    = "A"

  alias {
    name                   = module.xml_internal_alb.this_lb_dns_name
    zone_id                = module.xml_internal_alb.this_lb_zone_id
    evaluate_target_health = true
  }
}