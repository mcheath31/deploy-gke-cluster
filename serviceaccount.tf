resource "google_service_account" "service_account" {
  account_id   = "terraform-sa"
  display_name = "Service Account"
}