resource "aws_instance" "my_public_ec2" {
  ami = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public_subnet_1.id

  vpc_security_group_ids = [aws_security_group.public_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "${local.prefix}-public-ec2"
  }
}