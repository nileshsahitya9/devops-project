vpc_config = {
  vpc01 = {
    vpc_cidr_block = "10.0.0.0/16"

    tags = {
      Name =  "my_vpc"
    }
  }
}

subnet_config = {

  "public-ap-south-1a" = {

    vpc_name = "vpc01"    

    cidr_block = "10.0.1.0/24"

    availability_zone = "ap-south-1a"

    tags = {
      Name = "public-ap-south-1a"
    }
  }

   "public-ap-south-1b" = {

    vpc_name = "vpc01"    

    cidr_block = "10.0.64.0/24"

    availability_zone = "ap-south-1b"

    tags = {
      Name = "public-ap-south-1b"
    }
  }


   "private-ap-south-1a" = {

    vpc_name = "vpc01"    

    cidr_block = "10.0.128.0/24"

    availability_zone = "ap-south-1a"

    tags = {
      Name = "private-ap-south-1a"
    }
  }

   "private-ap-south-2a" = {

    vpc_name = "vpc01"    

    cidr_block = "10.0.192.0/24"

    availability_zone = "ap-south-1b"

    tags = {
      Name = "private-ap-south-1b"
    }
  }
}


internet_GW_config = {
  igw01 = {
    vpc_name = "vpc01"

    tags = {
      "Name" = "My_IGW"
    }
  }
}

aws_route_table_config = {

  RT01 = {
    vpc_name = "vpc01"
    gateway_name = "igw01"
    tags = {
      "Name" = "Public-Route"
    }
  }

  RT02 = {

    vpc_name = "vpc01"
    gateway_name = "igw01"
    tags = {
      "Name" = "Private-Route"
    }
    
  }

  RT03 = {

    vpc_name = "vpc01"
    gateway_name = "igw01"
    tags = {
      "Name" = "Private-Route"
    }
    
  }

}

elastic_IP_config = {
  eip01 = {
    tags = {
      Name = "nat01"
    }
  }
   eip02 = {
    tags = {
      Name = "nat02"
    }
  }
}

nat_GW_config = {
  natgW01 = {

  }

  natgW02 = {
    
  }
}

aws_route_table_association_config= {

}