terraform {
  backend "s3" {
    bucket = "week4-eksterra"
    key    = "backend/ToDo-App.tfstate"
    region = "us-west-2"
    dynamodb_table = "10weeksofcloudops-week4"
  }
}