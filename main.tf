resource "aws_security_group" "sg_disable_group" {
  count         = "${var.disable_sg_group}"
  name          = "${var.sg_name}"
  description   = "${var.sg_description}"
  vpc_id        = "${var.vpc_id}"

  dynamic ingress {
    for_each = var.ingress_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_enable_group" {
  count         = "${var.enable_sg_group}"
  name          = "${var.sg_name}"
  description   = "${var.sg_description}"
  vpc_id        = "${var.vpc_id}"

  dynamic ingress {
    for_each = var.ingress_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
    security_groups = "${var.sg_groups}"
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
