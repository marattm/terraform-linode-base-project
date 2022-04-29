SHELL = /bin/bash

DATE=$(shell date +%y-%m-%d-%H%M%S)


# TERRAFORM

terraform-init:
	@printf "\n%s\n%s\n%s\n\n" "/!\ Will use a local backends /!\ " "If you want to initialize with a remote backend run this:" "terraform init -backend-config=backends.example.tfvars"
	terraform init



terraform-fmt:
	terraform fmt

terraform-validate:
	terraform validate

terraform-show:
	terraform show

terraform-state-list:
	terraform state list

terraform-output:
	terraform output

terraform-destroy:
	terraform destroy -var-file=${tfvars} -var-file=terraform.tfvars



sandbox-init:
	terraform init -backend-config=./tf-envs/sandbox/backends.tfvars -migrate-state

sandbox-plan: terraform-fmt terraform-validate
	mkdir -p terraform-plan-output
	terraform plan -var-file=./tf-envs/sandbox/secrets.tfvars -var-file=terraform.tfvars -out terraform-plan-output/terraform-plan-${DATE}

sandbox-apply: terraform-fmt terraform-validate
	terraform apply -var-file=./tf-envs/sandbox/secrets.tfvars -var-file=terraform.tfvars

sandbox-refresh:: terraform-fmt terraform-validate
	terraform refresh -var-file=./tf-envs/sandbox/secrets.tfvars -var-file=terraform.tfvars

sandbox-destroy:
	terraform destroy -var-file=./tf-envs/sandbox/secrets.tfvars -var-file=terraform.tfvars



dev-init:
	terraform init -backend-config=./tf-envs/dev/backends.tfvars -migrate-state

dev-plan: terraform-fmt terraform-validate
	mkdir -p terraform-plan-output
	terraform plan -var-file=./tf-envs/dev/secrets.tfvars -var-file=terraform.tfvars -out terraform-plan-output/terraform-plan-${DATE}

dev-apply: terraform-fmt terraform-validate
	terraform apply -var-file=./tf-envs/dev/secrets.tfvars -var-file=terraform.tfvars

dev-refresh:: terraform-fmt terraform-validate
	terraform refresh -var-file=./tf-envs/dev/secrets.tfvars -var-file=terraform.tfvars

dev-destroy:
	terraform destroy -var-file=./tf-envs/dev/secrets.tfvars -var-file=terraform.tfvars



staging-init:
	terraform init -backend-config=./tf-envs/staging/backends.tfvars -migrate-state

staging-plan: terraform-fmt terraform-validate
	mkdir -p terraform-plan-output
	terraform plan -var-file=./tf-envs/staging/secrets.tfvars -var-file=terraform.tfvars -out terraform-plan-output/terraform-plan-${DATE}

staging-apply: terraform-fmt terraform-validate
	terraform apply -var-file=./tf-envs/staging/secrets.tfvars -var-file=terraform.tfvars

staging-refresh:: terraform-fmt terraform-validate
	terraform refresh -var-file=./tf-envs/staging/secrets.tfvars -var-file=terraform.tfvars

staging-destroy:
	terraform destroy -var-file=./tf-envs/staging/secrets.tfvars -var-file=terraform.tfvars



prod-init:
	terraform init -backend-config=./tf-envs/prod/backends.tfvars -migrate-state

prod-plan: terraform-fmt terraform-validate
	mkdir -p terraform-plan-output
	terraform plan -var-file=./tf-envs/prod/secrets.tfvars -var-file=terraform.tfvars -out terraform-plan-output/terraform-plan-${DATE}

prod-apply: terraform-fmt terraform-validate
	terraform apply -var-file=./tf-envs/prod/secrets.tfvars -var-file=terraform.tfvars

prod-refresh:: terraform-fmt terraform-validate
	terraform refresh -var-file=./tf-envs/prod/secrets.tfvars -var-file=terraform.tfvars

prod-destroy:
	terraform destroy -var-file=./tf-envs/prod/secrets.tfvars -var-file=terraform.tfvars




# LINODE

list-linode-images:
	linode-cli images list

list-linode-types:
	linode-cli linodes types

# LinID=$(linode-cli linodes list --text | grep "${Label}" | awk '{print $1}')
