variable "private_subnets_ids" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "ivolve-eks-cluster"
}