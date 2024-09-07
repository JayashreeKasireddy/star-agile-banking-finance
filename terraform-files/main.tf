resource "aws_instance" "app-server" {
  ami = ""
  instance_type = "t2.micro"
  key_name = " "
  vpc_security_group_ids = ["sg-
  connection {
  type = "ssh"
  user = "ubuntu"
  private_key = 
  host = self.public_ip
  }
provisioner "remote-exec" {
   inline = ["echo 'wait to start the instance' "]
  }
tags = {
  Name = "app-server"
  }
provisioner "local-exec" {
   command = "echo ${aws_instance.app-server.public_ip} > inventory"
   }
provisioner "local-exec" {
   command = "ansible-playbook /var/lib/jenkins/workspace/banking-finance/terraform-files/ansibleplaybook.yml"
   }
}
