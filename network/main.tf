resource "google_compute_network" "network" {
  name = join("-", [
    var.name,
    "internal-private-vpc"])
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name = join("-", [
    var.name,
    "subnetwork"])
  ip_cidr_range = var.ip_cidr_range
  region = var.region
  network = google_compute_network.network.self_link
}

resource "google_compute_firewall" "minecraft" {
  name = join("-", [
    var.name,
    "ingress-mc-ssh"])
  network = google_compute_network.network.self_link
  direction = "INGRESS"
  priority = 3000
  allow {
    protocol = "tcp"
    ports = [
      var.minecraft_server_port]
  }
  allow {
    protocol = "tcp"
    ports = [
      "22"]
  }
  source_ranges = [
    "0.0.0.0/0"]

  target_tags = var.tags
}

resource "google_compute_address" "minecraft" {
  name = "minecraft-static-ip"
  region = var.region
}

output "target_tags" {
  value = google_compute_firewall.minecraft.target_tags
  description = "The private IP address of the main server instance."
}

output "vm_ip_address" {
  value = google_compute_address.minecraft.address
}
output "network_name" {
  value = google_compute_network.network.name
}
output "subnetwork_name" {
  value = google_compute_subnetwork.subnet.name
}

