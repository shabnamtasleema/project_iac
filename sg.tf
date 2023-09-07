resource "aws_security_group" "instance_sc2" {
  name        = "allow_sc2"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.aws_vpc_id

  # ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  # }

  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }

  tags = {
    Name = "allow_sc2"
  }
}

resource "aws_security_group_rule" "alb_access" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.instance_sc1.id
  cidr_blocks       = ["10.0.0.0/8"]

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
  name        = "allow_sc1"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_sc1"
  }
}