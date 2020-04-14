variable "ip_address_name" {
  default = ""
}
variable "region" {
  default = ""
}

variable "project_id" {
  default = ""
}

variable "name" {
  default = ""
}

variable "minecraft_server_port" {
  default = ""
}
variable "tags" {
  type = list(string)
  default = [
    "minecraft"]
}

variable "ip_cidr_range" {
  default = ""
}
