module "vm" {
  source = "./modules/vm"

  vm_name    = var.vm_name
  vm_sg_name = module.security.vm_sg_name
  lb_sg_id   = module.security.elb_sg_id
  vpc_id     = module.networking.vpc_id
}

module "networking" {
  source = "./modules/networking"

  dns_name = var.dns_name
}

module "security" {
  source = "./modules/security"

  vpc_id = module.networking.vpc_id
}