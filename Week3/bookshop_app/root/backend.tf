terraform {
  backend "s3" {
    bucket         = "2tier-piyush"
    key            = "backend/10weeksofcloudops-Terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "2tier_Piyush"
  }
}
