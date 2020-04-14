resource "google_service_account" "minecraft" {
  account_id = "gce-minecraft-vpc-user"
  display_name = "minecraft gce instance"
}


output "sa_email" {
  value = google_service_account.minecraft.email
  description = "The service account used by the minecraft instance."
}
