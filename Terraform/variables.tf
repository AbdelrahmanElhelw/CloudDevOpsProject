variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "subnet_tags" {
  type    = list(string)
  default = ["zone-a", "zone-b"]
}

variable "key_name" {
  description = "The name of the AWS Key Pair to use for EC2"
  type        = string
  # هنحط القيمة دي وإحنا بنعمل Apply أو في فايل tfvars
}