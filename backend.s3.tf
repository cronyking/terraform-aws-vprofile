terraform{
    backend "s3" {
       bucket = "terra-vprofile-state1985"
       key = "terraform/backend"
       region = "us-east-2"
    }
}