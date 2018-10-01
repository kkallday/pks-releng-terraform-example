output "storefront_public_ip" {
  value = "${google_compute_address.storefront.address}"
}
