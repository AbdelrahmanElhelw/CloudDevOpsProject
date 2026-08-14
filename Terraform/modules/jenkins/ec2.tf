resource "aws_security_group" "jenkins_sg" {
  name   = "ivolve-jenkins-sg"
  vpc_id = var.vpc_id


  # Allow SSH for Ansible (Port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow Web UI access (Port 8080)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow server to download updates and plugins
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Jenkins EC2 Instance
resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  # عشان نضمن انه هياخد public ip  بس
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "ivolve-jenkins-server"
    Role = "jenkins"
  }



}