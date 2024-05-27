terraform {
  backend "s3" {
    bucket         = "my-iac-s3-backend" #"<your_bucket_name>"
    key            = "terraform/tf.state"
    region         = "us-east-1"            # Update with your desired region
    dynamodb_table = "terraform-state-lock" # Optional: Use DynamoDB for state locking
  }
}
