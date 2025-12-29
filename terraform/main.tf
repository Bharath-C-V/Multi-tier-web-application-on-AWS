provider "aws" {
  region = "us-west-2"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = aws_subnet.my_subnet[*].id
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = aws_subnet.my_subnet[*].id
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}

resource "aws_db_instance" "my_db" {
  allocated_storage = 20
  engine          = "mysql"
  engine_version  = "8.0"
  instance_class  = "db.t3.micro"
  name            = "mydb"
  username        = "admin"
  password        = "Password123"
  skip_final_snapshot = true
  publicly_accessible = false
}
