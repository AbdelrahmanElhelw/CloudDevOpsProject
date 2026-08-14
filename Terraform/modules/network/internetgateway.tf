resource "aws_internet_gateway" "ivolve_igw" {
  vpc_id = aws_vpc.ivolve_vpc.id

  tags = {
    Name = "main-igw"
  }
}

# 2. Elastic IP for NAT Gateway

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "nat-gateway-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  # Ensure IGW is created before the NAT GW

  depends_on = [aws_internet_gateway.ivolve_igw]

  tags = {
    Name = "main-nat-gateway"
  }
}