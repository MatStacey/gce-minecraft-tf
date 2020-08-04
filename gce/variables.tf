variable "name" {
  default = "minecraft"
}
variable "machine_type" {
  default = "n1-standard-1"
}
variable "zone" {
  default = "europe-west2-b"
}
variable "tags" {
  default = ""
}
variable "auto_delete_disk" {
  type = bool
  default = false
}
variable "disk_name" {
  default = ""
}
variable "network_name" {
  default = ""
}
variable "sa_email" {
  default = ""
}
variable "scopes" {
  default = ""
}
variable "preemptible" {
  type = bool
  default = true
}
variable "auto_restart" {
  type = bool
  default = false
}
variable "disk_type" {
  default = ""
}
variable "image" {
  default = ""
}
variable "vm_ip_address" {
  default = ""
}
variable "subnetwork_name" {
  default = ""
}
variable "startup_script" {
  default = ""
}