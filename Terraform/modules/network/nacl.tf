resource "aws_network_acl" "main_nacl" {
  vpc_id = aws_vpc.ivolve_vpc.id

  subnet_ids = concat(aws_subnet.public_subnet[*].id, aws_subnet.private_subnet[*].id)

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0

  }
  tags = {
    Name = "main-nacl"
  }
}
