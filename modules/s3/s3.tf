resource "aws_s3_bucket" "web-artifacts-259411494746" {
  bucket = "web-artifacts-259411494746"

  tags = {
    Name        = "web-artifacts-259411494746"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.web-artifacts-259411494746.id
  key    = "index.html"
  source = "./modules/s3/index.html"

  etag = filemd5("./modules/s3/index.html")
}