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

data "template_file" "init_data" {
  template = file("${path.module}/scripts/add-ssh-setup-go.yml")
}

resource "aws_instance" "vm" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.vm_size
  associate_public_ip_address = true

  user_data = data.template_file.init_data.rendered

  tags = {
    managedBy = "Terraform"
    Name      = var.vm_name
  }
}