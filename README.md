# aws_terraform_module_security_group [![Build Status](https://travis-ci.com/UCLALibrary/aws_terraform_module_fargate.svg?branch=master)](https://travis-ci.com/UCLALibrary/aws_terraform_module_fargate)

## Security Group Module Usage
Creating a security group that assumes global egress and CIDR inputted ingress
```
module "cantaloupe_fargate_sg" {
  source           = "git::https://github.com/UCLALibrary/aws_terraform_module_security_group.git?ref=IIIF-395"
  sg_name          = "my_security_group"
  sg_description   = "my_security_group_description"
  vpc_id           = "${aws_vpc.id}"
  ingress_ports    = [80]
  ingress_allowed  = [0.0.0.0/0]
  sg_groups        = null
  disable_sg_group = 1
}
```
Creating a security group that assumes global egress and specified AWS resources for ingress. E.g. only allow load balancer or EC2 instances to access this resource
```
module "cantaloupe_fargate_sg" {
  source           = "git::https://github.com/UCLALibrary/aws_terraform_module_security_group.git?ref=IIIF-395"
  sg_name          = "my_security_group"
  sg_description   = "my_security_group_description"
  vpc_id           = "${aws_vpc.id}"
  ingress_ports    = [80]
  sg_groups        = "${aws_lb.id}"
  enable_sg_group = 1
}
```

## Dependencies
* Upload ACM certificate prior to running Terraform
* Retrieve ARN in `us-east-1`
