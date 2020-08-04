resource "google_compute_disk" "standard-disk" {
  name = join("-", [
    var.name,
    "disk"])
  type = var.disk_type
  zone = var.zone
  image = var.image #base image
}

# Compute engine instance
# Accepts startup script (upload to gcs manually or add a gcs module here)
resource "google_compute_instance" "instance" {
  name = join("-", [
    "gce",
    var.name,
    "vm"])
  machine_type = var.machine_type
  zone = var.zone
  tags = var.tags

  #
  metadata_startup_script = var.startup_script

  boot_disk {
    auto_delete = var.auto_delete_disk
    # Keep disk after shutdown (game data)
    source = google_compute_disk.standard-disk.self_link
  }

  network_interface {
    network = var.network_name
    subnetwork = var.subnetwork_name
    access_config {
      nat_ip = var.vm_ip_address
    }
  }

  service_account {
    email = var.sa_email
    scopes = var.scopes
  }

  scheduling {
    preemptible = var.preemptible #may terminate at any stage.
    automatic_restart = var.auto_restart
  }
}
