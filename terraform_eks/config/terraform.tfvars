

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

   "private-ap-south-1b" = {

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
    private = 0
    vpc_name = "vpc01"
    gateway_name = "igw01" // used for routing traffic form subnet to internet
    tags = {
      "Name" = "Public-Route"
    }
  }

  RT02 = {
    private = 1
    vpc_name = "vpc01"
    gateway_name = "natgW01"
    tags = {
      "Name" = "Private-Route"
    }
    
  }

  RT03 = {
    private = 1
    vpc_name = "vpc01"
    gateway_name = "natgW02"
    tags = {
      "Name" = "Private-Route"
    }
    
  }

}

elastic_IP_config = { // we need elastic IP because whenever natgateway stop or restart it's IP get changes
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
    eip_name = "eip01"
    subnet_name = "public-ap-south-1a"

    tags = {
      "Name" = "natGW01"
    }
  }

  natgW02 = {
    eip_name = "eip02"
    subnet_name = "public-ap-south-1b"

    tags = {
      "Name" = "natGW02"
    }
  }
}

aws_route_table_association_config= {

  RT01Assoc = {

    subnet_name = "public-ap-south-1a"

    route_table_name =  "RT01"

  }
   
  RT02Assoc = {
    subnet_name = "private-ap-south-1a"

    route_table_name = "RT02"
  }
  
  RT03Assoc = {
    subnet_name = "public-ap-south-1b"

    route_table_name = "RT01"
  }

  RT04Assoc = {
    subnet_name = "private-ap-south-1b"

    route_table_name = "RT03"
    
  }
}

aws_eks_cluster_config = {

  "my-eks-cluster" = {
    eks_cluster_name = "my-eks-cluster"

    subnet1 = "public-ap-south-1a"
    subnet2 = "public-ap-south-1b"
    subnet3 = "private-ap-south-1a"
    subnet4 = "private-ap-south-1b"

    tags = {
        Name = "my-eks-cluster"
    }
  }

}

aws_eks_node_group_config = {
  "eks-node-01" = {
    node_group_name = "eks-node-01"
    eks_cluster_name = "my-eks-cluster" 

    node_iam_role = "eks-node-group-01"

    subnet1 = "private-ap-south-1a"
    subnet2 = "private-ap-south-1b"

    tags = {
      Name = "eks-node-01"
    }
  }

  "eks-node-02" = {
    node_group_name = "eks-node-02"
    eks_cluster_name = "my-eks-cluster" 

    node_iam_role = "eks-node-group-02"

    subnet1 = "private-ap-south-1a"
    subnet2 = "private-ap-south-1b"

    tags = {
      Name = "eks-node-02"
    }
  }
}