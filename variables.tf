variable "network" {
  default = ""
}

variable "machine_type" {
  default = ""
}

variable "inbound_port" {
  default = ""
}

variable "auto_delete_disk" {
  type = bool
  default = false
}

variable "network_name" {
  default = ""
}

variable "disk_type" {
  default = ""
}

variable "scopes" {
  default = [
    "userinfo-email"]
}

variable "preemptible" {
  type = bool
  default = true
}

variable "auto_restart" {
  type = bool
  default = false
}

variable "tags" {
  type = list(string)
  default = []
}

# Permenant IP address, stays around when VM is off
variable "ip_address_name" {
  default = ""
}

variable "disk_name" {
  default = ""
}

variable "name" {
  default = ""
}

variable "zone" {
  default = ""
}

variable "nat_ip" {
  default = ""
}

variable "project_id" {
  default = ""
}

variable "region" {
  default = ""
}

variable "image" {
  default = ""
}

variable "ip_cidr_range" {
  default = ""
}
