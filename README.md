# aws_terraform_module_security_group [![Build Status](https://travis-ci.com/UCLALibrary/aws_terraform_module_fargate.svg?branch=master)](https://travis-ci.com/UCLALibrary/aws_terraform_module_fargate)

## Security Group Module Usage
Creating a security group that assumes global egress and CIDR inputted ingress. These fields are required.
```
module "cantaloupe_fargate_sg" {
  source           = "git::https://github.com/UCLALibrary/aws_terraform_module_security_group.git"
  sg_name          = "my_security_group"
  sg_description   = "my_security_group_description"
  vpc_id           = "${aws_vpc.id}"
  ingress_ports    = [80, 8181]
  ingress_allowed  = [0.0.0.0/0]
  sg_groups        = null
}
```
Creating a security group that assumes global egress and specified AWS resources for ingress. E.g. only allow load balancer or EC2 instances to access this resource
```
module "cantaloupe_fargate_sg" {
  source           = "git::https://github.com/UCLALibrary/aws_terraform_module_security_group.git"
  sg_name          = "my_security_group"
  sg_description   = "my_security_group_description"
  vpc_id           = "${aws_vpc.id}"
  ingress_ports    = [80, 8181]
  # Note that you do NOT need to set ingress_allowed in this scenario
  ingress_allowed  = null
  sg_groups        = "[${aws_lb.id}]"
}
```

## Dependencies
* A VPC Must be created and the ID passed into this module
* If you have any AWS resources you want to grant access via a security group, you'll also need to pass in those IDs as well
