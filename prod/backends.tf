# remote backends for the tfstate

terraform {
  backend "s3" {
    bucket = "tf-state-67ehr"
    key    = "terraform-linode-base-project/prod/terraform.tfstate"
    region = "us-east-2"

    # endpoint                    = "ap-south-1.linodeobjects.com" # e.g. us-est-1.linodeobjects.com
    # skip_credentials_validation = true
    # access_key                  = ""
    # secret_key                  = ""
  }
}
