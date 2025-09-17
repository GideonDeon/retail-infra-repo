output "cluster_name" {
  value = module.eks.cluster_name
}

output "dev_readonly_access_key_id" {
  value = aws_iam_access_key.dev_readonly_key.id
}

output "dev_readonly_secret_access_key" {
  value     = aws_iam_access_key.dev_readonly_key.secret
  sensitive = true
}
