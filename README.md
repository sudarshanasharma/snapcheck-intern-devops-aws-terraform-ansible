## How to implement this project:
1. Please clone this repository in a machine with terraform and ansible installed. I have tested it on an Ubuntu machine with ansible 2.9.16 and Terraform v0.13.6. You might have to change the file permissions of the SSH private key file (chmod 0400 gangamma.pem) for the EC2 instance

2. Please execute the following steps in order:

   ./terraform init
   
   ./terraform plan
   
   ./terraform apply
   
Please provide your AWS Access Key ID and AWS Secret Key when prompted. 
