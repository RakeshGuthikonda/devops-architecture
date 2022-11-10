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
module "subnetwork"{
    source = "/modules/global"
}
module "vpc"{
    source = "/modules/global"
}
module "vm-instance"{
    source = "/modules/global"

}
