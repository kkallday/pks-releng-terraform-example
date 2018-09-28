resource "google_compute_instance" "store" {
  project = "cf-sandbox-kkelani"
  name         = "store"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["allow-internal", "allow-external"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  scratch_disk { }

  network_interface {
    network = "default"

    access_config { }
  }
}

resource "google_compute_instance" "order-fulfillment" {
  project = "cf-sandbox-kkelani"
  name         = "order-fulfillment"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["allow-internal"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  scratch_disk { }

  network_interface {
    network = "default"

    access_config { }
  }
}
