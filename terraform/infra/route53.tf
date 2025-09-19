# -------------------------------------------------------------------
# Route53 Hosted Zone
# -------------------------------------------------------------------

variable "domain_name" {
  type        = string
  description = "The domain name for the application"
  default     = "retailstoredeon.name.ng" 
}

resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Name = "${var.domain_name}-zone"
  }
}

output "route53_zone_id" {
  value = aws_route53_zone.main.zone_id
}


resource "aws_route53_record" "ui_alias" {
  zone_id = "Z042483533P5XFSUAP6YJ"
  name    = "ui.${var.domain_name}"
  type    = "A"

  alias {
    name                   = "k8s-retail-uiingres-8dc4eb95a1-2126640833.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }
}
