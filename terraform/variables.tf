variable "project" {
    default = "project-362016"
}

variable "region" { 
    default = "us-central1" 
}

variable "zones" { 
    default = "us-central1-a"
}

variable "cluster_name" {
    default = "demo-gke"
}

variable "network" { 
    default = "default"
}

variable "subnetwork" { 
    default = "" 
}

variable "ip_range_pods" { 
    default = "" 
}

variable "ip_range_services" { 
    default = "" 
}