resource "aws_instance" "app-server" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name = "jaya-key"
  vpc_security_group_ids = ["sg-0ff3a74e564c5e6bb"]
  provisioner "remote-exec" {
  connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file("./jaya-key.pem")
     host = self.public_ip
     }

      inline = ["echo 'waiting to start the instance'"]
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
