#SelfService Demo Main.tf

variable "instance_size" {
  default = "small"
}
variable "instance_count" {
  default = "5"
}
variable "instance_environment" {
  default = "dev"
}

locals {
  instance_size = {
    small  = { "instance_type" = "t2.small", "region" = "us-east-2", "ami" = "ami-0d8f6eb4f641ef691" },
    medium = { "instance_type" = "t2.medium", "region" = "us-east-2", "ami" = "ami-0d8f6eb4f641ef691" },
    large  = { "instance_type" = "t2.large", "region" = "us-east-2", "ami" = "ami-0d8f6eb4f641ef691" },
    xlarge = { "instance_type" = "t2.xlarge", "region" = "us-east-2", "ami" = "ami-0d8f6eb4f641ef691" }
  }
}



output "instance_type" {
  value = "${local.instance_size[var.instance_size].instance_type}"
}
#output "instance_ids" {
#  value = module.aws_main.aws_instance.my_instance[*].private_ip
#}

output "region" {
  value = "${local.instance_size[var.instance_size].region}"
}

output "ami" {
  value = "${local.instance_size[var.instance_size].ami}"
}
//--------------------------------------------------------------------
// Modules
module "ssd_ec2" {
  source  = "app.terraform.io/BryansWorld/ssdEC2/aws"
  version = "0.0.1"
  instance_type        = "${local.instance_size[var.instance_size].instance_type}"
  region               = "${local.instance_size[var.instance_size].region}"
  ami                  = "${local.instance_size[var.instance_size].ami}"
  instance_size        = var.instance_size
  instance_count       = var.instance_count
  instance_environment = var.instance_environment
}
