#!/bin/bash

# modules_symlinks.sh


# For local development of modules,
# it makes it easier to apply changes
# and debug when working with local modules

set -eu

WORKSPACE="${1:-$HOME/workspace}";
PROJECT_NAME="${2:-terraform-linode-base-project}"

MODULES=(
terraform-linode-module-nodebalancer
terraform-linode-module-webserver
terraform-linode-module-dbserver
terraform-linode-module-network
)

for MODULE in "${MODULES[@]}"; do

    if [[ -L "$WORKSPACE/$PROJECT_NAME/modules/$MODULE" ]] && [[ -e "$WORKSPACE/$PROJECT_NAME/modules/$MODULE" ]]; then
        echo "$MODULE is a already symlinked"
    else
        printf "\nSymlinking:\n%s\n" "$WORKSPACE/$MODULE --> $WORKSPACE/$PROJECT_NAME/modules/$MODULE"
        cd "$WORKSPACE/$PROJECT_NAME" && \
        ln -s "$WORKSPACE/$MODULE"  "$WORKSPACE/$PROJECT_NAME/modules/$MODULE"
    fi

done
