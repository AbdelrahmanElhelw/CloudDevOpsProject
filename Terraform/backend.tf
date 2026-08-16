terraform {
    backend "s3" {
    bucket         = "ivolve-project-bucket-elhelw"
    key            = "test/backend.tfstate"    
    use_lockfile   = true
    region         = "us-east-2"
  }
}
