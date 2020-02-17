resource "aws_security_group" "sg" {
  name          = var.sg_name
  description   = var.sg_description
  vpc_id        = var.vpc_id

  dynamic ingress {
    for_each = var.ingress_ports
    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      cidr_blocks     = var.ingress_allowed
      security_groups = var.sg_groups
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
