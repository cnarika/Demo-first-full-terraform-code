resource "aws_instance" {
  ami             = "${data.aws_ami.amazon-linux-2.id}"
  instance_type   = "t2.small"
  key_name        = "${var.keyname}"
  vpc_id          = "${aws_vpc.development-vpc.id}"
  #vpc_security_group_ids = ["${aws_security_group.sg_allow_ssh_jenkins.id}"]
  vpc_security_group_ids = ["${aws_security_group.sg_allow_ssh_ec2.id}"]
  subnet_id          = "${aws_subnet.public-subnet-1.id}"
  #name            = "${var.name}"
  #user_data = "${file("Data_install_jenkins.sh")}"

  associate_public_ip_address = true
  tags = {
    Name = "cna-ec2"
  }
}