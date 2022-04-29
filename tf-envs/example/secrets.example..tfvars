# example file for sensitive secret settings

LN_API_TOKEN = ""
LN_REGION    = ""

AWS_ACCESS_KEY = ""
AWS_SECRET_KEY = ""
AWS_REGION     = ""

authorized_keys = ["~/.ssh/id_ed25519.pub"]
public_key_path = "~/.ssh/id_ed25519.pub"

linode_web_instance_type       = "g6-nanode-1"
linode_web_instance_node_count = 2

linode_db_instance_type       = "g6-nanode-1"
linode_db_instance_node_count = 1

SITE   = "example"         # would label servers:
ID     = "1"               # example-db1.dev.example.com
DOMAIN = "dev.example.com" # example-web1.dev.example.com
