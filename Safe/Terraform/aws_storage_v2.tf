resource "aws_s3_bucket" "pass4" {
  region        = "us-west-2"
  bucket        = "my-bucket-pass4-${var.environment}"
  acl           = "private"
  force_destroy = false
  tags          = { Name = "my-bucket" }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/pass4/"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "pass4" {
  bucket                  = aws_s3_bucket.pass4.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "pass3" {
  region        = "us-west-2"
  bucket        = "my-bucket-pass3-${var.environment}"
  acl           = "private"
  force_destroy = false
  tags          = { Name = "my-bucket" }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/pass3/"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "pass3" {
  bucket                  = aws_s3_bucket.pass3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "pass2" {
  region        = "us-west-2"
  bucket        = "my-bucket-pass2-${var.environment}"
  acl           = "private"
  force_destroy = false
  tags          = { Name = "my-bucket" }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/pass2/"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "pass2" {
  bucket                  = aws_s3_bucket.pass2.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "pass1" {
  region        = "us-west-2"
  bucket        = "my-bucket-pass1-${var.environment}"
  acl           = "private"
  force_destroy = false
  tags          = { Name = "my-bucket" }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/pass1/"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "pass1" {
  bucket                  = aws_s3_bucket.pass1.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "pass" {
  region        = "us-west-2"
  bucket        = "my-bucket-pass-${var.environment}"
  acl           = "private"
  force_destroy = false

  tags = { Name = "my-bucket" }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "pass" {
  bucket                  = aws_s3_bucket.pass.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "passcomplex" {
  acl    = "private"
  bucket = var.passcomplex_bucket_name

  versioning {
    enabled = true
    mfa_delete = true
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/passcomplex/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowPutObjectFromSpecificRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:role/${var.specific_role}"
        }
        Action   = ["s3:PutObject"]
        Resource = "arn:aws:s3:::${var.passcomplex_bucket_name}/*"

      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "passcomplex" {
  bucket                  = aws_s3_bucket.passcomplex .id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private"
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/this/"
  }
  versioning {
    enabled = true
    mfa_delete = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
