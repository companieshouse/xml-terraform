# ------------------------------------------------------------------------------
# EWF Key Pair
# ------------------------------------------------------------------------------

resource "aws_key_pair" "xml_keypair" {
  key_name   = var.application
  public_key = local.xml_ec2_data["public-key"]
}
