variable "env_name" {}

variable "vm_size" {
  default = "t2.micro"
}

locals {
  vm_name = "btc-tracker-${var.env_name}"
}