provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "ecs" {
  source         = "./modules/ecs"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  nginx_image    = var.nginx_image
}

output "nginx_endpoint" {
  value = module.ecs.nginx_endpoint
} 