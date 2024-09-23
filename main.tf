terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "snowflake_terraform_test"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
  username = "ROHIT"  
  account  = "UXB89546"
  private_key_path = "/root/.ssh/id_rsa"
  region   = "us-east-1.aws"
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
