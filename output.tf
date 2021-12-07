output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnet_ids_eks : s.cidr_block]
}