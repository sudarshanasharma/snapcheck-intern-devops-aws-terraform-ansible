provider "aws" {
    access_key = var.option_1_access_key
    secret_key = var.option_2_secret_key
    region = "us-west-2"
}


resource "aws_security_group" "server_sg" {
  name ="server_sg"
  # SSH ingress access for provisioning
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access for provisioning"
  }

  ingress {
    from_port = 0
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow access to mongodb servers"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "MyInstance" {
    ami = "ami-07dd19a7900a1f049"
    instance_type = "t2.micro"
    key_name = "gangamma"
    security_groups = [ aws_security_group.server_sg.name ]
    tags = {
        Name = "EC2_Instance_Terraform"
    }
}

resource "null_resource" "MyInstance" {
 provisioner "local-exec" {
    command = "sleep 200; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory --private-key=gangamma.pem mongo.yml" 
}

}
    
