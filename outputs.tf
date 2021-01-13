### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  ec2-ip = aws_instance.MyInstance.public_ip
 }
 )
 filename = "inventory"
}
