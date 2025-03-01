variable "aws_region" {
  description = "aws region"
  default = "ap-south-1"
}

variable "aws_ec2_ami_id" {
 description = "provide ami id for ubuntu"
 default = "ami-00bb6a80f01f03502"  
}
variable "aws_ec2_type" {
    description = "provide ec2 type"
    default = "t2.micro"
  
}
variable "aws_ec2_count" {
   default = 1    
}
locals {
  key1 ="instace_1" 
 key2 ="instace_2" 
 key3 ="instace_3" 
 }
