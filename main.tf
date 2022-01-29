terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.8.0"
    }
  }
}

provider "google" {
  credentials = file("./keyfile.json")
  scopes      = ["https://www.googleapis.com/auth/drive", "https://www.googleapis.com/auth/bigquery"]

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_bigquery_dataset" "example_dataset" {
  dataset_id    = "example_dataset"
  friendly_name = "example_dataset"
  description   = "example_dataset, you can "
  location      = var.region
  # default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = var.service_account_email
  }

  access {
    role          = "READER"
    user_by_email = var.user_email
  }
}

resource "google_bigquery_table" "example_table" {
  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
  table_id   = "example_table"

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "column1",
    "type": "STRING",
    "mode": "REQUIRED",
    "description": "column1"
  },
  {
    "name": "column2",
    "type": "INT64",
    "mode": "NULLABLE",
    "description": "column2"
  },
  {
    "name": "created_at",
    "type": "TIMESTAMP",
    "mode": "REQUIRED",
    "description": "data created time"
  },
  {
    "name": "updated_at",
    "type": "TIMESTAMP",
    "mode": "REQUIRED",
    "description": "data updated time"
  }
]
EOF

}

