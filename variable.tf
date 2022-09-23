variable "region" {
  description = "My region" #is optional
  default = "us-east-1"
}
   variable "environment" {
    default = "development"
   }
   variable "vpc_cidr" {
    description = "VPC Cidr block"
   }
   variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 cidr block"
}
variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 cidr block"
}
variable "public_subnet_3_cidr" {
  description = "Public Subnet 3 cidr block"
}
variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 cidr block"
}
variable "private_subnet_2_cidr" {
  description = "Private Subnet 2 cidr block"
}
variable "private_subnet_3_cidr" {
  description = "Private Subnet 3 cidr block"
}
variable  "instance_type" {
instance = "${var.instance}"
}

# another way of doing 1-3; enter variable value in .auto.tfvariable "region" { }
  


 #region = "us-east-1"
    vpc = "vpc-5234832d"
    ami = "ami-0c1bea58988a989155"
    itype = "t2.micro"
    subnet = "subnet-81896c8e"
    publicip = true
    keyname = "myseckey"
    secgroupname = "IAC-Sec-Group"