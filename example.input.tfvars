#Project
project_id = ""
region = "europe-west2"
zone = "europe-west2-b"

#GCE
machine_type = "n1-standard-1"
auto_delete_disk = false
disk_type = "pd-standard"
image = "ubuntu-1604-lts" #BASE IMAGE

#Network
network_name = "gce-vpc-network"
ip_address_name = "gce-external-static-ip"
tags = ["ssh-allow"]
ip_cidr_range = "10.0.0.0/29"
inbound_port = 8080
