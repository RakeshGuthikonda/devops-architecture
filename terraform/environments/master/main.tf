provider "google" {
  region      = "${var.region}"
  zone="us-central1-c"
}

resource "google_project" "giridhar_project-10" {
  name       = "giridhar-project-10"
  project_id = "giridhar-project-10"

  org_id = "${var.gsuite_org_id}"
  billing_account = "${var.billing_account_id}"
}


resource "google_project_service" "project" {
  project = "${google_project.giridhar_project-10.project_id}"
  service = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com","compute.googleapis.com"]
  disable_dependent_services = true
}

# provider "google" {
#   project = "${google_project.giridhar_project-8.project_id}"
#   region      = "${var.region}"
#   zone="us-central1-c"
# }


# Create a single Compute Engine instance
resource "google_compute_instance" "vm_instance" {
  project = "${google_project.giridhar_project-10.project_id}"
  name         = "terraform-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-c"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
  }
  allow_stopping_for_update = "true"
}





# resource "google_project_iam_binding" "gsuite_project_owner" {
#   project = "${google_project.giridhar_project-2.project_id}"
#   role    = "roles/owner"

#   members = [
#     "user:${var.gsuite_user}",
#     "user:${var.billing_account_user}",
#   ]
# }
