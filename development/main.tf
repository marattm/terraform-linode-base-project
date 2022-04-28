# module invocations
module "nodebalancer" {
  # source                  = "./modules/nodebalancer"
  source                  = "git@github.com:marattm/terraform-linode-module-nodebalancer.git"
  region                  = var.LN_REGION
  node_count              = var.linode_web_instance_node_count
  web_servers_private_ips = module.webserver.web_servers_private_ips
}

module "webserver" {
  # source              = "./modules/webserver"
  source          = "git@github.com:marattm/terraform-linode-module-webserver.git"
  public_key_path = var.public_key_path
  root_password   = var.root_password
  region          = var.LN_REGION
  label           = var.linode_web_instance_label
  group           = var.linode_web_instance_group
  image           = var.linode_web_instance_image
  instance_type   = var.linode_web_instance_type
  node_count      = var.linode_web_instance_node_count
  swap_size       = var.linode_web_instance_swap_size
  tags            = var.linode_web_instance_tags
}

module "dbserver" {
  # source              = "./modules/dbserver"
  source           = "git@github.com:marattm/terraform-linode-module-dbserver.git"
  public_key_path  = var.public_key_path
  root_password    = var.root_password
  region           = var.LN_REGION
  db_node_count    = var.db_node_count
  db_instance_type = var.db_instance_type
}

module "network" {
  # source                  = "./modules/network"
  source                  = "git@github.com:marattm/terraform-linode-module-network.git"
  linode_ids              = module.webserver.web_linode_ids
  db_linode_ids           = module.dbserver.db_linode_ids
  web_servers_private_ips = module.webserver.web_servers_private_ips
}
