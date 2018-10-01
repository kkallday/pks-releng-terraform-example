resource "google_compute_instance" "storefront" {
  name         = "${var.env_name}-storefront"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["${var.env_name}-allow-internal", "${var.env_name}-allow-external"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  scratch_disk {}

  network_interface {
    subnetwork = "${google_compute_subnetwork.default.name}"

    access_config {
      nat_ip = "${google_compute_address.storefront.address}"
    }
  }

  metadata_startup_script = "sudo apt-get -y install nginx && sudo /etc/init.d/nginx start"
}

resource "google_compute_instance" "order-fulfillment" {
  name         = "${var.env_name}-order-fulfillment"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["${var.env_name}-allow-internal"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  scratch_disk {}

  network_interface {
    subnetwork = "${google_compute_subnetwork.default.name}"

    access_config {}
  }
}
