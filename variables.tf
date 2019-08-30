variable "sg_name" {}
variable "sg_description" {}
variable "vpc_id" {}
variable "ingress_ports" {}
variable "sg_groups" {}
variable "enable_sg_group" { default = 0 }
variable "disable_sg_group" { default = 0 }

