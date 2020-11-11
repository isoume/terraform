
resource "aws_s3_bucket" "terraform-s3" {
  
  bucket = "My-bucket-name"

  versioning {
   # enabled = true | false
  }

  lifecycle {
    #prevent_destroy = true |false
  }
  
  tags = {
    Name = "That 's a bucket i create with terraform"
  }
}
