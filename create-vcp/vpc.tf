#The definitions of the vpcs
resource "aws_vpc" "vpc_" {
  cidr_block="${lookup(var.cidr_vpc, var.env)}"
  instance_tenancy="default"
  tags={
     Name = "${var.env}"
  }
}

#The private subnet in the differents environments
resource "aws_subnet" "subnet_private" {
  vpc_id="${aws_vpc.vpc_.id}"
  cidr_block="${lookup(var.subnets,var.env)}.private"
  tags={
     Name="${var.env}_private_subnet"
  }
}

#The public subnet in the differents environment
resource "aws_subnet" "subnet_public" {
  vpc_id="${aws_vpc.vpc_.id}"
  cidr_block="${lookup(var.subnets,var.env)}.public}"
  tags={
    Name="${var.env}_public_subnet"
  }
}

#The internet Gateway for the public subnet
resource "aws_internet_gateway" "gateway_internet" {
  vpc_id="${aws_vpc.vpc_.id}"
  tags={
    Name="${var.env}_internet_gateway"
  }
}

#The route table for public subnet
resource "aws_route_table" "public_route_table" {
 vpc_id="${aws_vpc.vpc_.id}"
 route={
   cidr_block="0.0.0.0/0"
   gateway_id= "${aws_internet_gateway.gateway_internet.id}"
 }
}

# Associate the public subnet and the route table
resource "aws_route_table_association" "pub_sunbet_pub_route_table" {
  subnet_id="${aws_subnet.subnet_public.id}"
  route_table_id="${aws_route_table.public_route_table.id}"
}
