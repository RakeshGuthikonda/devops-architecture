provider "google" {
  region      = "${var.region}"
}

resource "google_project" "test_project" {
  name       = "test-project-3"
  project_id = "test-project-3"

  org_id = "${var.gsuite_org_id}"
#   billing_account = "${var.billing_account_id}"
}

# resource "google_project_iam_binding" "gsuite_project_owner" {
#   project = "${google_project.test_project.project_id}"
#   role    = "roles/owner"

#   members = [
#     "user:${var.gsuite_user}",
#     "user:${var.billing_account_user}",
#   ]
# }


# resource "google_billing_account_iam_binding" "editor" {
#   billing_account_id = "${var.billing_account_id}"
#   role               = "roles/billing.user"
#   members = [
#     "user:banothuramu@gnimmagadda.com",
#   ]
# }



# provider "google" {
#     project ="giridhar-project-1"
#     region="us-central1"
#     zone="us-central1-c"
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
