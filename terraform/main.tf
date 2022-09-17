## Data Sources
data "google_client_config" "default" {}

## GKE Cluster
module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "9.3.0"

  # required variables
  project_id        = var.project
  name              = var.cluster_name
  region            = var.region
  zones = ["${var.zones}"]
  network           = var.network
  subnetwork        = var.subnetwork
  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services

  # optional variables
  kubernetes_version       = "1.22.11-gke.400"
  regional                 = true
  create_service_account   = false
  remove_default_node_pool = true

  # addons
  network_policy             = false
  horizontal_pod_autoscaling = true
  http_load_balancing        = true

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "n1-standard-1"
      min_count          = 1
      max_count          = 3
      local_ssd_count    = 0
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []
    default-node-pool = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

  node_pools_labels = {
    all = {}
    default-node-pool = {
      default-node-pool = true,
    }
  }

  node_pools_tags = {
    all = []
    default-node-pool = [
      "default-node-pool",
    ]
  }

}