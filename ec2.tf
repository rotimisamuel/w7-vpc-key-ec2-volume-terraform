//ec2.tf

resource "aws_instance" "server1" {
  ami                    = "ami-068c0051b15cdb816"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pusub1.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = aws_key_pair.key1.key_name
  user_data_base64       = filebase64("setup.sh")

  tags = {
    Name = "Terraform_instance"
  }
}

//ebs volume

resource "aws_ebs_volume" "ebs" {
  size              = 20
  availability_zone = aws_instance.server1.availability_zone
  tags = {
    Name = "Extra-volume"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  instance_id = aws_instance.server1.id
  volume_id   = aws_ebs_volume.ebs.id
  device_name = "/dev/sdh"
}
