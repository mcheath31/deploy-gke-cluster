resource "google_container_cluster" "primary" {
  name               = "mheathgke"
  location           = "us-central1-c"
  initial_node_count = 2
  network = google_compute_network.vpc_network.self_link
  node_config {

    service_account = google_service_account.service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      app = "devops_test"
    }
    tags = ["devops", "mheath"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}