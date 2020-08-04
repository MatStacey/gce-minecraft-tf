#Create a Service Account for the VM
resource "google_service_account" "gce-vpc-user" {
  account_id = "gce-vpc-user"
  display_name = "GCE Instance Pattern 1"
}

#output email address of service account for other modules
output "sa_email" {
  value = google_service_account.gce-vpc-user.email
  description = "The service account used by the minecraft instance."
}
