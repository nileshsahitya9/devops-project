resource "aws_route_table" "example" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internetGW_id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags = var.tags
}


