data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami_owner]
}

data "aws_subnet_ids" "i" {
  vpc_id = var.vpc_id
}

data "aws_subnet" "i" {
  for_each = data.aws_subnet_ids.i.ids
  id       = each.value
}

resource "aws_lb" "btc" {
  name               = "btc-alert-api"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = [for s in data.aws_subnet.i : s.id]

  enable_deletion_protection = false

  tags = {}
}

resource "aws_lb_target_group" "btc" {
  name        = "btc-alert-api"
  port        = 3000
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "btc" {
  target_group_arn = aws_lb_target_group.btc.arn
  target_id        = aws_instance.vm.id
  port             = 3000
}


data "template_file" "init_data" {
  template = file("${path.module}/scripts/add-ssh-setup-go.yml")
}

resource "aws_instance" "vm" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.vm_size
  associate_public_ip_address = true

  user_data = data.template_file.init_data.rendered

  security_groups = [var.vm_sg_name]
  tags = {
    managedBy = "Terraform"
    Name      = var.vm_name
  }
}