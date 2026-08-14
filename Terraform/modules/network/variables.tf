variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "sub_private_cidr_list" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "sub_public_cidr_list" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "sub_availablility_zones_list" {
  description = "List of availability zones for the subnets"
  type        = list(string)
}
variable "sub_tags_list" {
  type = list(string)
}
