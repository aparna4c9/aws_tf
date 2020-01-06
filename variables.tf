variable "region" {
  description = "aws region where resoruces are to be deployed"
  default = "us-east-1"
}

variable "profile"  {
  description = "profile defined in your aws credentials"
  default = "ranbaddi"
}

variable "ec2_size" {
  description = "This is the instance.type ex: t2.micro, t3.small etc"
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing key pair"
  default = "ranbaddi"
}
