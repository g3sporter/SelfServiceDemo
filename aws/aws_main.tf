 
variable "name_d" { 
    default = "notDefined"
    }

variable "size" {
  default = "small"
}
locals {
  size = {
    small = {"count"="2", "instance"="t2.micro"},
    medium = {"count"="4", "instance"="t2.medium"},
    large = {"count"="4", "instance"="t2.large"}
 }
}

   output count {
    	value = "${local.size[var.size].count}"
    }


output "Instance" {
    	value = "${local.size[var.size].instance}"
    }
