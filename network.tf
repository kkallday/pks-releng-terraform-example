resource "google_compute_network" "default" {
  name                    = "${var.env_name}-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_subnetwork" "default" {
  name          = "${var.env_name}-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = "${google_compute_network.default.self_link}"
}
