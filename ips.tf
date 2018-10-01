resource "google_compute_address" "storefront" {
  name = "${var.env_name}-storefront"
}
