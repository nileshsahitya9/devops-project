variable "vpc_config" {}

variable "subnet_config" {}

variable "internet_GW_config" {}

variable "aws_route_table_config" {}

variable "elastic_IP_config" {}

variable "nat_GW_config" {}

variable "aws_route_table_association_config" {}

variable "aws_eks_node_group_config" {}

variable "aws_eks_cluster_config" {}


variable "region" {
  default = "ap-south-1"
}