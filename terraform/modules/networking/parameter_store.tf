resource "aws_ssm_parameter" "ssl_cert" {
  name        = "/ssl/cert/arn"
  description = "ARN for the SSL cert"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "vpc_id" {
  name        = "/vpc/id"
  description = "ID for the VPC"
  type        = "String"
  value       = aws_vpc.main.id
}