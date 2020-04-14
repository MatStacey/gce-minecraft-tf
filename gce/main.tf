resource "google_compute_disk" "minecraft" {
  name = join("-", [
    var.name,
    "disk"])
  type = var.disk_type
  zone = var.zone
  image = var.image
  #"cos-cloud/cos-stable"
}

# VM to run Minecraft, we use preemptable which will shutdown within 24 hours
resource "google_compute_instance" "minecraft" {
  name = join("-", [
    "gce",
    var.name,
    "vm"])
  machine_type = var.machine_type
  zone = var.zone
  tags = var.tags
  #google_compute_firewall.minecraft.target_tags[0]

  # Run itzg/minecraft-server docker image on startup
  # The instructions of https://hub.docker.com/r/itzg/minecraft-server/ are applicable
  # For instance, Ssh into the instance and you can run
  #  docker logs mc
  #  docker exec -i mc rcon-cli
  # Once in rcon-cli you can "op <player_id>" to make someone an operator (admin)
  # Use 'sudo journalctl -u google-startup-scripts.service' to retrieve the startup script output
  metadata_startup_script = format("docker run -d -p %d:%d -e EULA=TRUE -v /var/minecraft:/data --name mc --rm=true itzg/minecraft-server:latest;", var.minecraft_port, var.minecraft_port)

  boot_disk {
    auto_delete = var.auto_delete_disk
    # Keep disk after shutdown (game data)
    source = google_compute_disk.minecraft.self_link
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
    preemptible = var.preemptible
    # Closes within 24 hours (sometimes sooner)
    automatic_restart = var.auto_restart
  }
}
