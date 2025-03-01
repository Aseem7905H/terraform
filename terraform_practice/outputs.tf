output "aws_ec2_public_ip"{
   value = aws_instance.my_instance[*].public_ip
}

#output "aws_ec2_public_ip" {
 #   value = {for key, instance in aws.aws_instance.my_instance:key => instance.public_ip}
  
#}
