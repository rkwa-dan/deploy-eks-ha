

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnet_ids_eks : s.cidr_block]
}

output "Command_to_check_AWS_Cli_creds" {
 value = var.checkCredsOutput
#  value = "$ aws sts get-caller-identity"
}

output "Command_to_connect_to_eks_cluster" {
value = var.connectToEksClusterCommand
#  ${var.eks-cluster-name}

}