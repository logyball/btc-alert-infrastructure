resource "aws_ssm_parameter" "ip_address" {
  name        = "/vm/ip"
  description = "IP Address for the prod env"
  type        = "String"
  value       = aws_instance.vm.public_ip
}

resource "aws_ssm_parameter" "elb_arn" {
  name        = "/elb/arn"
  description = "ARN for the elastic load balancer"
  type        = "String"
  value       = aws_lb.btc.arn
}
