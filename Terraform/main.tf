module "network" {
  source                       = "./modules/network"
  vpc_cidr                     = var.vpc_cidr
  sub_private_cidr_list        = var.private_subnets
  sub_public_cidr_list         = var.public_subnets
  sub_availablility_zones_list = var.azs
  sub_tags_list                = var.subnet_tags
}

module "jenkins" {
  source           = "./modules/jenkins"
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_ids[0]
  key_name         = var.key_name
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = "ivolve-app-repo"
}

module "eks" {
  source              = "./modules/eks"
  private_subnets_ids = module.network.private_subnet_ids

}