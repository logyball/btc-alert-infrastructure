output "ip" {
  value = aws_instance.vm.public_ip
}

output "id" {
  value = aws_instance.vm.id
}