SHELL = /bin/bash

DATE=$(shell date +%y-%m-%d-%H%M%S)


# TERRAFORM

terraform-init:
	terraform init

terraform-fmt:
	terraform fmt

terraform-validate:
	terraform validate

tfvars=secrets.tfvars

terraform-plan: terraform-fmt terraform-validate
	mkdir -p terraform-plan-output
	terraform plan -var-file=${tfvars} -var-file=terraform.tfvars -out terraform-plan-output/terraform-plan-${DATE}

terraform-apply: terraform-fmt terraform-validate
	terraform apply -var-file=${tfvars}

terraform-refresh: terraform-fmt terraform-validate
	terraform apply -refresh-only -var-file=${tfvars} -var-file=terraform.tfvars

terraform-show:
	terraform show

terraform-state-list:
	terraform state list

terraform-output:
	terraform output

terraform-destroy:
	terraform destroy -var-file=${tfvars} -var-file=terraform.tfvars


# LINODE

list-linode-images:
	linode-cli images list

list-linode-types:
	linode-cli linodes types

# LinID=$(linode-cli linodes list --text | grep "${Label}" | awk '{print $1}')
