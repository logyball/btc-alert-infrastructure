# SSL cert

resource "aws_route53_zone" "primary" {
  name = var.dns_name
}

resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "Main VPC"
  }
}