resource "aws_security_group" "instance_sc2" {
  name        = "${var.environment}-${var.security_grp}-1"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.aws_vpc_id

  dynamic "ingress" {
    for_each = var.settings

    content {
      description = ingress.key
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "${var.environment}-${var.security_grp}-1"
  }
}


variable "settings" {
  type = map(object({
    port = number
  }))
  default = {
    "Allows SSH access" = {
      port = 22
    },
    "Allows HTTP traffic" = {
      port = 80
    },
    "Allows HTTPS traffic" = {
      port = 443
    }
  }

}
resource "aws_security_group_rule" "alb_to_instance" {
  type              = "egress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = aws_security_group.instance_sc1.id
  cidr_blocks       = ["10.0.0.0/8"]
}


resource "aws_security_group" "instance_sc1" {
  name        = "${var.environment}-${var.security_grp}-2"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.aws_vpc_id
  
  tags = {
    Name = "${var.environment}-${var.security_grp}-2"
  }
}