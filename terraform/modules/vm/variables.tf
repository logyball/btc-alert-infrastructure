variable "ami_name" {
  default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}

variable "ami_owner" {
  default = "099720109477" # canonical
}

variable "vm_size" {
  default = "t2.micro"
}

variable "vm_sg_name" {}
variable "lb_sg_id" {}
variable "vpc_id" {}
variable "vm_name" {}