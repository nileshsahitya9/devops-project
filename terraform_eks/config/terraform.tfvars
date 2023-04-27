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