#VPC

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = "exchange_my_vpc"
  }
}

# 2 Subnets
resource "aws_subnet" "subnets" {
    count = length(var.subnet_cidr)
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet_cidr[count.index]
    availability_zone = data.aws_availability_zones.available.names[count.index]
    map_public_ip_on_launch = true
    tags = {
      "Name" = "exchange-${var.subnets_names[count.index]}"
    }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags={
        "Name" = "exchange-Internet-gateway"
    }

}

# Route Table

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0" #public
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      "Name" = "exchange-route-table" 
    }
  
}



# ----------------------------------------------------------------------------
# Route Table Association
# ----------------------------------------------------------------------------

# Associates the specified subnet with the designated route table.
# In this example, the "subnet_id" refers to the ID of the subnet,
# and "route_table_id" refers to the ID of the route table.

resource "aws_route_table_association" "route_table_association" {
    count = length(var.subnet_cidr)
    subnet_id = aws_subnet.subnets[count.index].id
    route_table_id = aws_route_table.rt.id

    
  
}


