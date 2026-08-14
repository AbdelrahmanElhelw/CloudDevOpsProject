resource "aws_vpc" "ivolve_vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  provisioner "local-exec" { #used to execute command when creating or modyfing a resource 
    command = "echo ${aws_vpc.ivolve_vpc.id} > vpc_id.txt "
  }

}
