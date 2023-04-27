module "vpc_modules" {
  source = "./terraform_eks/modules/aws_vpc"


  for_each = var.vpc_config

  vpc_cidr_block = each.value.vpc_cidr_block

  tags= each.value.tags
}

module "subnet_modules" {
  source = "./terraform_eks/modules/aws_subnets"

  for_each = var.subnet_config

  vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id

  subnet_cidr_block = each.value.cidr_block

  availability_zone = each.value.availability_zone

  tags = each.value.tags
}

module "internetGW_modules" {
  source = "./terraform_eks/modules/aws_internetGW"

  for_each = var.subnet_config

  vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id

  subnet_cidr_block = each.value.cidr_block

  availability_zone = each.value.availability_zone

  tags = each.value.tags
}

module "route_table_modules" {
  source = "./terraform_eks/modules/aws_route_table"

  for_each = var.subnet_config

  vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id

  subnet_cidr_block = each.value.cidr_block

  availability_zone = each.value.availability_zone

  tags = each.value.tags
}

module "route_table_association_modules" {
  source = "./terraform_eks/modules/aws_route_table_association"

  for_each = var.subnet_config

  vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id

  subnet_cidr_block = each.value.cidr_block

  availability_zone = each.value.availability_zone

  tags = each.value.tags
}