#!/bin/bash



#!/bin/bash

# create_terraform_project_template.sh

set -eu

description(){
cat << EOF
DESCRIPTIONS:
This script helps to setup a create a terraform a project structure.

USAGE: $0 [OPTIONS]

OPTIONS:
    -h      Show this message
    -p      Path to the project name

EXAMPLES: 
    - $0 -p .
    - $0 -p path/to/project_name

EOF
}

while getopts "hp:" OPTION; do
    case $OPTION in
        p)
            PROJECT_NAME_PATH="${OPTARG:-terraform_project_template}";
            ;;
        h | *)
            description;
            exit 1;
            ;;
    esac
done


# creating the project structure
# PROJECT_NAME_PATH="${1:-example_terraform_project}"

create_project_structure() {
    mkdir -p "${PROJECT_NAME_PATH}"/{development,staging,production,modules}
    mkdir -p "${PROJECT_NAME_PATH}"/modules/{web,db,lb}
    touch "${PROJECT_NAME_PATH}"/{development,staging,production}/{main.tf,variables.tf,outputs.tf,providers.tf,backends.tf,terraform.tfvars,secrets.tfvars}
    touch "${PROJECT_NAME_PATH}"/modules/{web,db,lb}/{main.tf,variables.tf,outputs.tf,providers.tf,backends.tf,terraform.tfvars,secrets.tfvars}
}

create_project_structure
