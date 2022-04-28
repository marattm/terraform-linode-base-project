SHELL = /bin/bash

DATE=$(shell date +%y-%m-%d-%H%M%S)


# TERRAFORM

terraform-init:
# create a new configuration — or check out an existing configuration from version control
# Terraform downloads the aws provider and installs it in a hidden subdirectory of your current working directory, named .terraform. 
# The terraform init command prints out which version of the provider was installed. 
# Terraform also creates a lock file named .terraform.lock.hcl which specifies the exact provider versions used, so that you can control when you want to update the providers used for your project.
	terraform init

terraform-fmt:
# format
	terraform fmt

terraform-validate:
# validate syntax	
	terraform validate

tfvars=secrets.tfvars

# Possible to provides multiples .tfvars files
# terraform apply \
# -var-file=non-secret-variables.tfvars \
# -var-file=secret-variables.tfvars

terraform-plan: terraform-fmt terraform-validate
	mkdir -p terraform-plan-output
	terraform plan -var-file=${tfvars} -out terraform-plan-output/terraform-plan-${DATE}

terraform-apply:
	terraform apply -var-file=${tfvars}

terraform-refresh:
	terraform apply -refresh-only -var-file=${tfvars}

container_name="YetAnotherName"
terraform-apply-with-var:
	terraform apply -var "container_name=${container_name}"  -var-file=${tfvars}
terraform-show:
	terraform show -var-file=${tfvars}

terraform-state-list:
	terraform state list -var-file=${tfvars}

terraform-output:
	terraform output -var-file=${tfvars}

terraform-destroy:
	terraform destroy -var-file=${tfvars}


# LINODE

list-linode-images:
	linode-cli images list

list-linode-types:
	linode-cli linodes types

# LinID=$(linode-cli linodes list --text | grep "${Label}" | awk '{print $1}')
