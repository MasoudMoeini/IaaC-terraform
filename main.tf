provider "google" {
  #credentials = file("warm-rookery-325409-9706537f6ad9.json")
  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone

  #project = "warm-rookery-325409"
  #region  = "us-central1"
  #zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
        image = "cos-cloud/cos-stable"
 
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}