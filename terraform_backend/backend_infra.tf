resource "aws_s3_bucket" "my_bucket" {
    bucket = "tf-ankit-state-bucket"
  tags ={
    Name= "tf_state_bucket"
  }
}
resource "aws_dynamodb_table" "my_dynamo_table" {
    name= "tf-ankit-state-dynamo-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
    
  
}
