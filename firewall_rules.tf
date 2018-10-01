resource "google_compute_firewall" "allow-external" {
  name        = "${var.env_name}-allow-external"
  network     = "${google_compute_network.default.name}"
  target_tags = ["${var.env_name}-allow-external"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
}

resource "google_compute_firewall" "allow-internal" {
  name    = "${var.env_name}-allow-internal"
  network = "${google_compute_network.default.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = [
    "${google_compute_subnetwork.default.ip_cidr_range}",
  ]
}
