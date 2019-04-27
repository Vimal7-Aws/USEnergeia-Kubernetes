provider "google" {
  credentials = "${file("pheonix.json")}"
  project     = "black-stream-231519"
  region      = "europe-west2"
}

resource "google_container_cluster" "pheonix_cluster" {
  name                     = "pheonix-cluster"
  location                     = "us-west1-b"
  remove_default_node_pool = true
}

resource "google_container_node_pool" "pheonix_pool" {
  name       = "pheonix-pool"
  cluster    = "${google_container_cluster.pheonix_cluster.name}"
  location       = "us-west1-b"
  node_count = 2

  node_config {
    machine_type = "f1-micro"
  }
}

