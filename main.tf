provider "aws" {
    access_key = "AKIAYDB77H5HQ37R5HGW"
    secret_key = "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"
    region = "us-west-2"
}
resource "aws_instance" "MyInstance" {
    ami = "ami-07dd19a7900a1f049"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2_Instance_Terraform"
    }
}