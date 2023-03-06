# THIS IS THE MAIN MODULE 

#To create an instance, must change the instance name
module "instances" {
  source = "./modules/instance"

  instance_name = "myinstancename"
  counts        = "1"
  zone          = "us-east1-b"
  project       = "san-test-274713"
  machine_type  = "f1-micro"
  disk_image    = "debian-cloud/debian-9"
  disk_size     = "10"
  disk_type     = "pd-standard"
  subnetwork    = "default"
  tags          = ["http-server"]
}

#To create a firewall rule, must change protocal, ports, targettag, name 
module "firewall" {
  source        = "./modules/firewall"
  protocol      = "tcp"
  ports         = ["22"]
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
  name          = "firewall-demo"

  #network       = "${data.google_compute_network.test-vpc.name}"
  network  = "default"
  project  = "san-test-274713"
  priority = "1000"
}

#TO CREATE A PROJECT 
/*
module "project" {
  source        = "./project"

project_name = "myprojectname"
}


module "gkeinstances" {
  source = "./modules/gkecluster"
}
*/
