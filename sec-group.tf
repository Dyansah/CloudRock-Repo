resource "aws_security_group" "Test-sec-group" {
  name        = "allow_HTTP"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.ingress-HTTP-port
    to_port          = var.ingress-HTTP-port
    protocol         = var.ingress-protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = var.ingress-SSH-port
    to_port          = var.ingress-SSH-port
    protocol         = var.ingress-protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = var.egress-port
    to_port          = var.egress-port
    protocol         = var.egress-protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Test-sec-group"
  }
}




