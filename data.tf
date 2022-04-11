data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnet" "main" {
  for_each = toset(data.aws_subnets.main.ids)
  id       = each.value
}