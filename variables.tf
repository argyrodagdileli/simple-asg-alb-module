variable "aws_region" {
  type        = string
  description = "The AWS region in which the resources are deployed. Defaults to us-east-1."
  default     = "us-east-1"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC in which the resources are deployed. Must be set"
  validation {
    condition     = length(var.vpc_id) > 4 && substr(var.vpc_id, 0, 4) == "vpc-"
    error_message = "The vpc_id value must be a valid VPC id, starting with \"vpc-\"."
  }
}

variable "ami_id" {
  type        = map(any)
  description = "The ID of Amazon Machine Image used for the deployed EC2 instances. Defaults to Amazon Linux 2 AMI 2.0.20220316.0 x86_64 HVM gp2."
  default = {
    eu-north-1     = "ami-0dbef1af74414d054"
    ap-south-1     = "ami-04a223c5825a793bc"
    eu-west-3      = "ami-01df7c80e2aa60122"
    eu-west-2      = "ami-0a4b5c4a6ada12bb0"
    eu-west-1      = "ami-010c802cb2f348b54"
    ap-northeast-3 = "ami-012b0e028ee9bb335"
    ap-northeast-2 = "ami-09fee16f759d3c3a2"
    ap-northeast-1 = "ami-0521a4a0a1329ff86"
    sa-east-1      = "ami-0df679e2b2ce72667"
    ca-central-1   = "ami-0cfc8f6b6d827ff08"
    ap-southeast-1 = "ami-02c62c1cc162ef9a1"
    ap-southeast-2 = "ami-0916f5ee07e7b15d6"
    eu-central-1   = "ami-056343e91872518f7"
    us-east-1      = "ami-03e0b06f01d45a4eb"
    us-east-2      = "ami-09662e4f2b2fb67f9"
    us-west-1      = "ami-052f64d0cd359fe1f"
    us-west-2      = "ami-0eb324d928acca58a"
  }
}
variable "instance_type" {
  type        = string
  description = "The EC2 instance type used . Defaults to t2.micro."
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "The key pair used to securely connect to the instance. Must be set."
}

variable "availability_zones" {
  type        = list(string)
  description = "List of the Availability Zones that the ALB will span. Must be at least two. Defaults to us-east-1a and us-east-1b"
  default     = ["us-east-1a", "us-east-1b"]

  validation {
    condition     = length(var.availability_zones) > 1
    error_message = "You must specify at least two Availability Zones for the ALB."
  }
}