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
