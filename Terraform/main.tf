
provider "aws" {
  region = "us-east-1"
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "todoapp" {
  name   = "todopp"
  vpc_id = aws_default_vpc.default.id
  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "todoapp"
  }
}


resource "aws_instance" "Jenkins-ToDo-App" {
  ami                    = "ami-053b0d53c279acc90"
  key_name               = "default-ec2"
  instance_type          = "t2.medium"
  subnet_id              = data.aws_subnets.default_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.todoapp.id]
  tags = {
    Name = "Jenkins"
  }


  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

}

resource "aws_instance" "Sonarqube-ToDo-App" {
  ami                    = "ami-053b0d53c279acc90"
  key_name               = "default-ec2"
  instance_type          = "t2.medium"
  subnet_id              = data.aws_subnets.default_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.todoapp.id]
  tags = {
    Name = "Sonarqube"
  }


  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

}

resource "aws_instance" "Docker-ToDo-App" {
  ami                    = "ami-053b0d53c279acc90"
  key_name               = "default-ec2"
  instance_type          = "t2.medium"
  subnet_id              = data.aws_subnets.default_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.todoapp.id]
  tags = {
    Name = "Docker"
  }


  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

}







