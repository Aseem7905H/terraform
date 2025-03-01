data "aws_ami" "os_image"{
    most_recent = true 
    owners = [ "099720109477" ]
    filter {
      name = "state"
      values = [ "available" ]
    }
    filter {
      name = "name"
      values = [ "ubuntu/images/*" ]
    }
}
# Create an SSH key pair
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("id_ed25519.pub")  #  SSH public key
}

# Create a default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Create a security group
resource "aws_security_group" "my_sg" {
  name        = "Z-plus"
  description = "Aseem Security Group"
  vpc_id      = aws_default_vpc.default.id

  # Allow SSH access
  ingress {
    description = "Allow SSH port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP access
  ingress {
    description = "Allow HTTP port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
    count = var.aws_ec2_count
  ami                    = data.aws_ami.os_image.id  #  AMI ID for your region
  instance_type          =   var.aws_ec2_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]  # security group reference

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "demo_tf_ec2"   
}
}
