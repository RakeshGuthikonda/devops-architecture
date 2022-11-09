provider "google" {
  region      = "${var.region}"
  zone="us-central1-c"
}

resource "google_project" "giridhar_project-3" {
  name       = "giridhar-project-3"
  project_id = "giridhar-project-3"

  org_id = "${var.gsuite_org_id}"
  billing_account = "${var.billing_account_id}"
}

# provider "google" {
#   project = "${google_project.giridhar_project-3.project_id}"
#   region      = "${var.region}"
#   zone="us-central1-c"
# }


# # Create a single Compute Engine instance
# resource "google_compute_instance" "vm_instance" {
#   name         = "terraform-instance"
#   machine_type = "e2-micro"
#   zone         = "us-central1-c"
#   tags         = ["ssh"]

#   boot_disk {
#     initialize_params {
#       image = "centos-cloud/centos-7"
#     }
#   }

#   network_interface {
#     network = "default"
#   }
#   allow_stopping_for_update = "true"
# }





# resource "google_project_iam_binding" "gsuite_project_owner" {
#   project = "${google_project.giridhar_project-2.project_id}"
#   role    = "roles/owner"

#   members = [
#     "user:${var.gsuite_user}",
#     "user:${var.billing_account_user}",
#   ]
# }
