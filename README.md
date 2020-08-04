A simple GCE hosted minecraft server on a private VPC using modules.

# Pre-requisites:

* terraform v0.12 [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
* A Google cloud project with billing enabled
* A GCS bucket named 'minecraft-tfstate' to manage terraform state
* You are executing terraform from an account with permissions to create networks and GCE instances.

It is recommended you set your GOOGLE_APPLICATION_CREDENTIALS to your SA Private Key:

`export GOOGLE_APPLICATION_CREDENTIALS=${PATH_TO_KEY}`

* Before executing a Plan you must populate the `${PROJECT_ID}` and `${BASE_IMAGE}` vars in `./example.input.tfvars`

# Preferences
Can be modified in the `./example.input.tfvars`

# Plan
Run a plan using the following command from the root directory of this repo:
`terraform plan --var-file=./example.input.tfvars`

Check your plan...

# Apply 
`terraform plan --var-file=./example.input.tfvars`

