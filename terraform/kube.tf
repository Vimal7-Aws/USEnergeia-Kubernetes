provider "google" {
  credentials = file("white-pheonix.json")
  project     = "golden-tenure-231009"
  region      = "europe-west2"
}

resource "google_container_cluster" "pheonix_cluster" {
  name                     = "pheonix-cluster"
  location                     = "us-west1-b"
  remove_default_node_pool = true
  initial_node_count = 1

}

resource "google_container_node_pool" "pheonix_pool" {
  name       = "pheonix-pool"
  cluster    = google_container_cluster.pheonix_cluster.name

  location       = "us-west1-b"
  node_count = 2

  node_config {
    machine_type = "n1-standard-2"
  }
}

