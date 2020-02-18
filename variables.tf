variable "sg_name" {}
variable "sg_description" {}
variable "vpc_id" {}
variable "ingress_ports" {}
variable "ingress_allowed" {
  default = ["0.0.0.0/0"]
}

variable "sg_groups" {
  default = null
}

variable "default_tag" {
  default = "SG-Terraform"
}
