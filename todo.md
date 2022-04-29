# todos

- MISC
  - [x] remove the swap variable
  - [x] reduce as much as possible the number of variables you need to parametrize
  - [x] update readme in module
  - [x] update readme in base project
  - [x] dev
  - [x] staging
  - [x] prod
  - [x] define tier listing
  - [x] update the variables for the node balancer module, and clean it up (at least for the label and the tags)
  - [x] update the variables for the network module, and clean it up (at least for the label and the tags)
  - [x] remove the user_data / remote exec scripts from dev/staging/prod | or let it in another branch for demo / example folder..

- MODULE
  - [ ] nodebalancer
    - [ ] add the LN LB SSL cert and SSL key for the nodebalancer
  - [ ] instance configuration
    - [ ] alerts
    - [ ] backup enabled
  - [ ] dns

- README
  - [ ] use versioning for your modules
  - [ ] define the branching policy if any needed
  - [ ] update modules' readme with the possibles variables
  - [x] explain the terraform init situation
  - [ ] explain in the readme the backend setup with the s3 bucket, and the permission to make this happen

- EXPLORE
  - [x] see what's the matter with the backend remote on s3 for the PROD ENV
  - [ ] how to test in terraform for
  - [ ] see how to push the a downstream repo at imagescape
  - [ ] the other type of structure for managing multiple states/env
    - [ ] 1 folder per env --> `main` branch
    - [ ] 1 main repo, many env folders with backends.tf / *.tfvars folder  --> `1-repo-multi-env-vars` branch
  - [ ] find a way to manage the 3 dev / staqing / prod env when developing one env without drifting..
  - [ ] the idea of making this whole project like a module???
  - [ ] all other modules linode can offer and see if some are relevant to integrate
