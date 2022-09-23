resource "aws_instance" "instance_type" {
  ami             = "${data.aws_ami.amazon-linux-2.id}"
  #itype   = "t2.micro"
  instance_type = "t2.micro"
  key_name        = "${var.keyname}"
  vpc_id          = "${aws_vpc.development-vpc.id}"
  #vpc_security_group_ids = ["${aws_security_group.sg_allow_ssh_jenkins.id}"]
  vpc_security_group_ids = "${aws_security_group.sg_allow_ssh_ec2.id}"
  #vpc_security_group_ids = ["${aws_security_group.sg_allow_ssh_ec2.id}"]
  subnet_id          = "${aws_subnet.public-subnet-1.id}"
  name            = "${var.name}"
  #user_data = "${file("Data_install_jenkins.sh")}"

  associate_public_ip_address = true
  tags = {
    Name = "cna-ec2"
  }
}
resource "aws_security_group" "project-iac-sg" {
  name = lookup(var.awsprops, "secgroupname")
  vpc_id = lookup(var.awsprops, "vpc")

  #To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  #To Allow Port 80 Transport
  ingress {
    from_port = 80
    protocol = ""
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}