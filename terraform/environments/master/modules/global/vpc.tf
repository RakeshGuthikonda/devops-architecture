resource "google_compute_network" "vpc"{
    name = "dev-vpc"
    auto_create_subnetworks = "false"
    routing_mode = "GLOBAL"
    mtu = 1460

}
resource "google_compute_subnetwork" "subnetwork" {
name = var.subnet_name
ip_cidr_range = "10.10.10.0/24"
region = var.region
network = "${google_compute_network.vpc.name}"
}
resource "google_compute_instance" "vm_instance"{
    name = "tf-instance-1"
    machine_type = "e2-micro"
    zone  = var.zone
    tags = ["iap-demo"]
    boot_disk {
        initialize_params {
            image = "centos-cloud/centos-7"
    }
}
network_interface {
    subnetwork = "${google_compute_subnetwork.subnetwork.name}"
}
allow_stopping_for_update = "true"
}
resource "google_compute_firewall" "firewall" {
    name        = "allow-iap"
    project     = var.project_id
    network     = google_compute_network.vpc.name

    direction = "INGRESS"
    allow {
        protocol = "tcp"
        ports    = ["22"]  
    }
    source_ranges = [
        "35.235.240.0/20"
    ]
}





