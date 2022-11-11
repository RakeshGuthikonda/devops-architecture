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

resource "google_project" "test_project17" {
  name       = "test-project17"
  project_id = var.project_id

  org_id = "${var.gsuite_org_id}"
  billing_account = "${var.billing_account_id}"
}

resource "google_project_service" "compute" {
  project = var.project_id
  service   = "compute.googleapis.com"

  disable_dependent_services = false
#   depends_on = [google_project.test_project17]
}

resource "google_project_service" "iap" {
  project = var.project_id
  service   = "iap.googleapis.com"


  disable_dependent_services = false
#   depends_on = [google_project.test_project17]
}






module "subnetwork"{
    source = "./modules/global"
    depends_on = [google_project_service.compute,google_project_service.iap]
}
module "vpc"{
    source = "./modules/global"
    depends_on = [google_project_service.compute,google_project_service.iap]
}
    
module "vm-instance"{
    source = "./modules/global"
     depends_on = [google_project_service.compute,google_project_service.iap]

}
