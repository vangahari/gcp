variable "project" {
    default = "apolloio-362016"
}

variable "region" { 
    default = "us-central1" 
}

variable "zones" { 
    default = "us-central1-a"
}

variable "cluster_name" {
    default = "apollo-demo-gke"
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