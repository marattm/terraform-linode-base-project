# module invocations
module "nodebalancer" {
  # source                  = "./modules/nodebalancer"
  source                  = "git@github.com:marattm/terraform-module-linode-nodebalancer.git"
  region                  = var.LN_REGION
  node_count              = var.node_count
  web_servers_private_ips = module.webserver.web_servers_private_ips
}

module "webserver" {
  # source              = "./modules/webserver"
  source              = "git@github.com:marattm/terraform-module-linode-webserver.git"
  public_key_location = var.public_key_location
  root_password       = var.root_password
  region              = var.LN_REGION
  node_count          = var.node_count
  instance_type       = var.instance_type
}

module "dbserver" {
  # source              = "./modules/dbserver"
  source              = "git@github.com:marattm/terraform-module-linode-dbserver.git"
  public_key_location = var.public_key_location
  root_password       = var.root_password
  region              = var.LN_REGION
  db_node_count       = var.db_node_count
  db_instance_type    = var.db_instance_type
}

module "network" {
  # source                  = "./modules/network"
  source                  = "git@github.com:marattm/terraform-module-linode-network.git"
  linode_ids              = module.webserver.web_linode_ids
  db_linode_ids           = module.dbserver.db_linode_ids
  web_servers_private_ips = module.webserver.web_servers_private_ips
}
