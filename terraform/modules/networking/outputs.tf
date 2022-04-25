output "vpc_id" {
  value = aws_vpc.main.id
}

# SSL CERT ARN - TODO
output "ssl_arn" {
  value = "arn:aws:acm:us-east-1:742164301198:certificate/703137fa-9939-4ed8-b330-e9d3f0191f7f"
}