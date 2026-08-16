resource "aws_eks_node_group" "ivolve_nodes" {
  cluster_name    = aws_eks_cluster.ivolve_cluster.name
  node_group_name = "ivolve-eks-node-group"

  node_role_arn = aws_iam_role.eks_node_role.arn

  subnet_ids = var.private_subnets_ids

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.small"]

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ecr_read_only,
  ]
}