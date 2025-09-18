module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 19.15.1"

  name                      = var.name
  kubernetes_version        = "1.33"

  addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    vpc-cni = {
      before_compute = true
    }
  }
    
    enable_irsa     = true
    vpc_id          = module.vpc.vpc_id
    subnet_ids      = module.vpc.private_subnets

    endpoint_private_access = true
    endpoint_public_access  = true
    endpoint_public_access_cidrs = ["0.0.0.0/0"]
    

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    bedrock_cluster = {
        min_size     = 1
        max_size     = 2
        desired_size = 1

        ami_type       = "AL2023_x86_64_STANDARD"
        instance_types = ["t3.medium"]
        capacity_type  = "SPOT"

        tags = {
            ExtraTag = "helloworld"
        }
    }
  }

enable_cluster_creator_admin_permissions = true

  access_entries = {
    dev_readonly_user = {
      principal_arn     = aws_iam_user.dev_readonly.arn
      kubernetes_groups = ["view"]
      username          = "dev-readonly"
    }
  }


  tags = var.tags
}