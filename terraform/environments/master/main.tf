terraform{
    required_providers{
        google = {
            source = "hashicorp/google"
        }
    }
}
provider "google"{
    project = var.project_id
    region = var.region
    zone = var.zone
}

# resource "google_project" "test_project" {
#   name       = "test-project"
#   project_id = var.project_id

#   org_id = "${var.gsuite_org_id}"
#   billing_account = "${var.billing_account_id}"
# }

resource "google_project_service" "project" {
  project = var.project_id
  service   = "compute.googleapis.com"
}


# module "subnetwork"{
#     source = "./modules/global"
# }
# module "vpc"{
#     source = "./modules/global"
# }
# module "vm-instance"{
#     source = "./modules/global"

# }
