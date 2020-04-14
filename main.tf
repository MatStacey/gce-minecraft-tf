/*
Connect with friends via a shared digital space in Minecraft.

This is a safe Minecraft server that won't break the bank. Game data is preserved across sessions.
Server is hosted on a permenant IP address. You need to start the VM each session, but it
will shutdown within 24 hours if you forget to turn it off.
Process is run in a sandboxed VM, so any server exploits cannot do any serious damage.

We are experimenting with providing support through a [google doc](https://docs.google.com/document/d/1TXyzHKqoKMS-jY9FSMrYNLEGathqSG8YuHdj0Z9GP34).
Help us make this simple for others to use by asking for help.


Features
- Runs [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server/) Docker image
- Preemtible VM (cheapest), shuts down automatically within 24h if you forget to stop the VM
- Reserves a stable public IP, so the minecraft clients do not need to be reconfigured
- Reserves the disk, so game data is remembered across sessions
- Restricted service account, VM has no ability to consume GCP resources beyond its instance and disk
- 2$ per month
  - Reserved IP address costs: $1.46 per month
  - Reserved 10Gb disk costs: $0.40
  - VM cost: $0.01 per hour, max session cost $0.24
*/

# We require a project to be provided upfront
# Create a project at https://cloud.google.com/
# Make note of the project ID
# We need a storage bucket created upfront too to store the terraform state
terraform {
  backend "gcs" {
    prefix = "minecraft"
    bucket = "minecraft-tfstate"
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

module "iam" {
  source = "./iam/"
}

module "network" {
  source = "./network/"
  minecraft_server_port = var.minecraft_port
  project_id = var.project_id
  region = var.region
  name = var.network_name
  tags = var.tags
  ip_address_name = var.ip_address_name
  ip_cidr_range = var.ip_cidr_range
}

module "gce" {
  source = "./gce/"
  machine_type = var.machine_type
  zone = var.zone
  minecraft_port = var.minecraft_port
  tags = module.network.target_tags
  auto_delete_disk = var.auto_delete_disk
  minecraft_disk = var.minecraft_disk
  network_name = module.network.network_name
  subnetwork_name = module.network.subnetwork_name
  vm_ip_address = module.network.vm_ip_address
  scopes = var.scopes
  preemptible = var.preemptible
  auto_restart = var.auto_restart
  disk_type = var.disk_type
  image = var.image
  sa_email = module.iam.sa_email
}


