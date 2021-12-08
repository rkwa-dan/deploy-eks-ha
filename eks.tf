module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_version = "1.21"
  cluster_name    = var.eks-cluster-name
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets

  worker_groups = [
    {
      instance_type = "m4.large"
      asg_max_size  = var.eks-pool-main-size
    }
  ]

}

//node pools config

resource "aws_eks_node_group" "eks-pool-main" {
  cluster_name    = var.eks-cluster-name
  node_group_name = "eks-pool-main"
  node_role_arn   = aws_iam_role.eks-ha.arn
  subnet_ids      = module.vpc.private_subnets
#  data.aws_subnet_ids.subnet_ids_eks.ids

  scaling_config {
    desired_size = var.eks-pool-main-size
    max_size     = 5
    min_size     = 1
  }

  update_config {
    max_unavailable = 2
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}



resource "aws_eks_node_group" "eks-pool-sec" {
  cluster_name    = var.eks-cluster-name
  node_group_name = "eks-pool-sec"
  node_role_arn   = aws_iam_role.eks-ha.arn
#  subnet_ids      = data.aws_subnet_ids.subnet_ids_eks.ids
  subnet_ids      =  module.vpc.private_subnets

  scaling_config {
    desired_size = var.eks-pool-sec-size
    max_size     = 5
    min_size     = 1
  }

  update_config {
    max_unavailable = 2
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}