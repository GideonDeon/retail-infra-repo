resource "kubernetes_cluster_role_binding" "dev_readonly_binding" {
  metadata {
    name = "dev-readonly-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "view"
  }

  subject {
    kind      = "User"
    name      = aws_iam_user.dev_readonly.name
    api_group = "rbac.authorization.k8s.io"
  }
}
