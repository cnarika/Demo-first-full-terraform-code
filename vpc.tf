resource "aws_vpc" "developmen-vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        name = "${var.environment}-vpc"
    }
    }
resource "aws_subnet" "public-subnet-1" {
cidr_block = "${var.public_subnet_1_cidr}"
vpc_id = "${aws_vpc.development.vpc.id}"
availability_zone = "${var.region}a"
tags = {
name = "${var.environment}.public-subnet-1"
aws_vpc = "${aws_vpc.development}"
}
}