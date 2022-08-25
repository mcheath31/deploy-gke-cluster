resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta

  location = "us-central1"
  repository_id = "my-repository"
  description = "Mheath artifact registry"
  format = "DOCKER"
}
resource "google_artifact_registry_repository_iam_member" "test-iam" {
  provider = google-beta

  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role   = "roles/artifactregistry.reader"
  member = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [
    google_service_account.service_account,
  ]
}