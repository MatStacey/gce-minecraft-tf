#Simple Terraform GCE Pattern

A Google Compute engine GCE instance with the following modules:

1. Creates Internal VPC with subnet `./network`
2. Creates firewall rules on VPC for allow-ingress for SSH and 1 specified ingress port `./network`
3. Creates Service Account with VPC User access `./iam`
4. Creates GCE Compute Instances inside created VPC, with attached service Account based on an image specified by user `./gce`

# Pre-requisites:

* terraform v0.12 [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
* A Google cloud project with billing enabled
* An existing GCS bucket named must exist in your project to manage terraform state remotely. 
    - By default it is named `gce-pattern-tf-state-admin` however you may wish to change this in `./main.tf`
    - If you wish to keep your state local you can remove the "backend" block from `./main.tf`

* You are executing terraform from an account with permissions to create networks and GCE instances.

It is recommended you set your GOOGLE_APPLICATION_CREDENTIALS to your SA Private Key / Add to Path:

`export GOOGLE_APPLICATION_CREDENTIALS=${PATH_TO_KEY}`

* Before executing a Plan you must populate the `${PROJECT_ID}` and `${BASE_IMAGE}` vars in `./example.input.tfvars`

# Running the Example

All variables can be modified in the `./example.input.tfvars` or separately create a new `input.tfvars` for your own variables.

## Plan
Run a plan using the following command from the root directory of this repo:
`terraform plan --var-file=./example.input.tfvars`

Check your plan...

## Apply 
`terraform plan --var-file=./example.input.tfvars`

