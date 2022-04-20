variable "env_name" {
  default = "prod"
}

variable "vm_size" {
  default = "t2.micro"
}
variable "dns_name" {
  default = "btcalerter.com"
}

locals {
  vm_name = "btc-tracker-${var.env_name}"
}