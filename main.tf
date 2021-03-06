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


