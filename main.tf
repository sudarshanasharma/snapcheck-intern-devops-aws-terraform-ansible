provider "aws" {
    
    region = "us-west-2"
}
resource "aws_instance" "MyInstance" {
    ami = "ami-07dd19a7900a1f049"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2_Instance_Terraform"
    }
}
