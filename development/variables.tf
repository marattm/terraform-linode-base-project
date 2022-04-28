variable "LN_API_TOKEN" {}
variable "LN_REGION" {}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}
variable "AWS_S3_BACKEND_BUCKET" {}
variable "AWS_S3_BACKEND_BUCKET_KEY" {}


# variable "authorized_keys" {
#   default = ""
#   type    = list(string)
# }

variable "authorized_keys" {}
variable "root_password" {}
variable "public_key_path" {}

variable "web_node_count" {}
variable "web_instance_type" {}
variable "db_node_count" {}
variable "db_instance_type" {}
