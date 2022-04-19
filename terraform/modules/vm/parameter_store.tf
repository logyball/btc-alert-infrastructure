resource "aws_ssm_parameter" "ip_address" {
  name        = "/${var.env_name}/vm/ip"
  description = "IP Address for the ${var.env_name} env"
  type        = "String"
  value       = aws_instance.vm.public_ip
}
