module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    subnet_cidr = var.subnet_cidr
}

module "sg" {
    source = "./modules/security-group"
    vpc_id = module.vpc.vpc_id
  
}