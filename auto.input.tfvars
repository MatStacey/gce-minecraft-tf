#Project
project_id = "gcp-personal-playpit"
region = "europe-west2"
zone = "europe-west2-b"

#GCE
machine_type = "n1-standard-1"
auto_delete_disk = false
disk_type = "pd-standard"
image = "cos-cloud/cos-stable"

#Network
network_name = "minecraft"
ip_address_name = "minecraft-static-ip"
tags = ["minecraft"]
ip_cidr_range = "10.0.0.0/29"
minecraft_port = 25565
