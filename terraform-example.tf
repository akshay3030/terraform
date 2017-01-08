variable "aws_region" {
    default = "us-east-1"
}

variable "rhelami" {
  default = {
    us-east-1 = "ami-436a702a"
  }
}
 
variable "aws_keypair" {
  default = "timski"
}

variable "timski-incoming" {
  default = "sg-778ddh13"
}

variable "timski-outbound" {
  default = "sg-664juik8li"
}

variable "timski-web" {
  default = "sg-43rfdo98j4"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "aws-lx-web-001" {
  ami = "${lookup(var.rhelami, var.aws_region)}"
  instance_type = "m1.small"
  key_name = "${var.aws_keypair}"
  availability_zone = "us-east-1b"
  security_groups = ["${var.timski-incoming}","${var.timski-outbound}","${var.timski-web}"]
  subnet_id = "subnet-24e6980c"
  private_ip = "10.133.0.5"
  user_data = "aws-lx-web-001"
}
