A simple GCE hosted minecraft server on a private VPC using modules.

# Pre-requisites:

* terraform v0.12 [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
* A Google cloud project with billing enabled
* A GCS bucket named 'minecraft-tfstate' to manage terraform state
* You are executing terraform from an account with permissions to create networks and GCE instances.

# Preferences
Can be modified in the `./mc-server.input.tfvars`

# Plan
Run a plan using the following command from the root directory of this repo:
`terraform plan --var-file=./mc-server.input.tfvars`

Check your plan...

# Apply 
`terraform plan --var-file=./mc-server.input.tfvars`

