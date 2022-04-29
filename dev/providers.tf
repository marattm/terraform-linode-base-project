terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.26.1"
    }
  }
}

provider "linode" {
  token = var.LN_API_TOKEN
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
  profile    = "default"
}
