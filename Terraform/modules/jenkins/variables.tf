variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type        = string
  description = "Jenkins goes in a public subnet to access the Web UI"
}

variable "key_name" {
  type        = string
  description = "The name of your AWS SSH Key Pair"
}