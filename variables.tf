provider "google" {
  project     = "${var.project}"
  region      = "us-central1"
  credentials = "${file("account.json")}"
}

variable "env_name" {
  type = "string"
}

variable "project" {
  type = "string"
}
