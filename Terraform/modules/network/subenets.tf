resource "aws_subnet" "private_subnet" {
  count             = 2
  vpc_id            = aws_vpc.ivolve_vpc.id
  cidr_block        = var.sub_private_cidr_list[count.index]
  availability_zone = var.sub_availablility_zones_list[count.index]

  tags = {
    Name = "private-${var.sub_tags_list[count.index]}"
  }

}
resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.ivolve_vpc.id
  cidr_block              = var.sub_public_cidr_list[count.index]
  availability_zone       = var.sub_availablility_zones_list[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${var.sub_tags_list[count.index]}"
  }

}






