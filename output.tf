output "Command_to_check_AWS_Cli_creds" {
 value = var.checkCredsOutput
#  value = "$ aws sts get-caller-identity"
}

output "connectToEksClusterCommand" {
  value = "$ aws eks --region region update-kubeconfig --name ${var.eks-cluster-name}"
}
#output "Command_to_connect_to_eks_cluster" {
#  value = var.connectToEksClusterCommand
##  ${var.eks-cluster-name}
#
#}