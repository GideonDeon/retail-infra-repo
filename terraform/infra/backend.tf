terraform {
  backend "s3" {
    bucket         = "pr-bedrock-bucket-deon2"
    key            = "eks_cluster_3.tfstate"      
    region         = "us-east-1"
    dynamodb_table = "pr-bedrock-locks"           
    encrypt        = true                           
  }
}
