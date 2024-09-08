resource "aws_instance" "app-server" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name = "jaya-key"
  vpc_security_group_ids = ["sg-0ff80cdf8844b2dc4"]
  connection {
  type = "ssh"
  user = "ubuntu"
  private_key = file("./jaya-key.pem")
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
   command = "ansible-playbook /var/lib/jenkins/workspace/BankingandFinance/terraform-files/ansibleplaybook.yml"
   }
}
