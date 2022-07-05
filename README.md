# Deploying Infrastructur into Google-Cloud 
[Reference](https://learn.hashicorp.com/tutorials/terraform/google-cloud-platform-build?in=terraform/gcp-get-started)<br/>
**Set up GCP**  <br>
Gcp project->project ID <br>
Google Compute Engine enabled <br>
GCP service account -> terraform agent as editor -> key
```
terraform init
``` 
```
terraform fmt 
```
```
terraform validate
```
```
terraform apply 
```
```
terraform show
```
```
terraform destroy
``` 
Change and Updating Infrastructure by adding new resources into main.tf 
```
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
``` 
Again run this command 
``` 
terraform apply
```
```
 resource "google_compute_instance" "vm_instance" {
   name         = "terraform-instance"
   machine_type = "f1-micro"
+  tags         = ["web", "dev"]
   ## ...
 }
 ```
``` 
terraform apply
```