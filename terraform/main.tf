module "vm" {
  source = "./modules/vm"

  env_name = var.env_name
  vm_name  = local.vm_name
}