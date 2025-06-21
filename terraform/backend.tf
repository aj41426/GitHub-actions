terraform {
  backend "s3" {
    bucket         = "tf-state-alvy"
    key            = "state/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "alvy-tf-lock"
    encrypt        = true
  }
}