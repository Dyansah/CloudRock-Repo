# EC2s
resource "aws_instance" "Test-server1" {
  ami                       = var.ami
  instance_type             = var.EC2-instance-type
  count                     = 1
  key_name                  = var.Test-server1-key-name
  availability_zone         = var.Pulic-sub1-availability-zone
  vpc_security_group_ids = [aws_security_group.Test-sec-group.id]
  subnet_id                 = aws_subnet.test-public-sub1.id
  associate_public_ip_address = "true"
  tags = {
  Name = "Test-server1"
  }
}

resource "aws_instance" "Test-server2" {
  ami                       = var.ami
  instance_type             = var.EC2-instance-type
  count                     = 1
  key_name                  = var.Test-server2-key-name
  availability_zone         = var.Pulic-sub2-availability-zone
  vpc_security_group_ids = [aws_security_group.Test-sec-group.id]
  subnet_id                 = aws_subnet.test-public-sub2.id
  associate_public_ip_address = "true"
  tags = {
  Name = "Test-server2"
  }
}

