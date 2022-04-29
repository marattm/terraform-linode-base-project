# terraform-linode-base-project

## Getting started

- Create a `secret.tfvars` file and update the vars.

    ```tfvars
    LN_API_TOKEN = ""
    LN_REGION    = ""

    AWS_ACCESS_KEY            = ""
    AWS_SECRET_KEY            = ""
    AWS_REGION                = ""
    AWS_S3_BACKEND_BUCKET     = "tfstate_bucket"
    AWS_S3_BACKEND_BUCKET_KEY = "terraform-linode-base-project/development/terraform.tfstate"

    authorized_keys = ["~/.ssh/id_ed25519.pub"]
    public_key_path = "~/.ssh/id_ed25519.pub"
    root_password   = "terrapass"


    # linode_web_instance_label = 
    linode_web_instance_type       = "g6-nanode-1"
    linode_web_instance_node_count = 2
    # linode_web_instance_swap_size = 
    # linode_web_instance_tags = 

    # linode_db_instance_label = 
    linode_db_instance_type = "g6-nanode-1"
    # linode_db_instance_node_count = 1
    # linode_db_instance_tags = 

    SITE = "example"
    ID   = "1"
    ```

- The values in the `terraform.tfvars` should be fine, as they are general, but can be overridden using a `override.tfvars` file.

- Change directory to the right environment

    ```console
    terraform-linode-base-project
    ├── development
    ├── staging
    ├── production
    ├── modules
    └── scripts
    ```

- `make terraform-init`

- `make terraform-plan`

## Base project and modules development

- To make the development of the base project and the modules easier run this command `./scripts/modules_symlinks.sh` this will update the  `~/workspace/terraform-linode-base-project` like below:

    ```console
    terraform-linode-module-dbserver         # .git
    terraform-linode-module-network          # .git
    terraform-linode-module-nodebalancer     # .git
    terraform-linode-module-webserver        # .git
    terraform-linode-base-project            # .git
    ├── development
    ├── staging
    ├── production
    ├── modules
    │   ├── terraform-linode-module-dbserver -> ../terraform-linode-module-dbserver
    │   ├── terraform-linode-module-network -> ../terraform-linode-module-network
    │   ├── terraform-linode-module-nodebalancer -> ../terraform-linode-module-nodebalancer
    │   └── terraform-linode-module-webserver -> ../terraform-linode-module-webserver
    └── scripts
    ```

- Then update the `development/maint.tf` modules sources:

    ```hcl
    module "webserver" {
        source = "../modules/terraform-linode-module-dbserver"
        ..
    }
    
    module "webserver" {
        source = "../modules/terraform-linode-module-network"
        ..
    }
    
    module "webserver" {
        source = "../modules/terraform-linode-module-nodebalancer"
        ..
    }
    
    module "webserver" {
        source = "../modules/terraform-linode-module-webserver"
        ..
    }
    
    ```

- `make terraform-init`

- `make terraform-plan`
