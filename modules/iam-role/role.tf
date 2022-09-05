
resource "aws_iam_policy" "iam_policy" {
  name   = "iam_policy_${var.name}"
  policy = file(var.iam_role_json_path)
}

resource "aws_iam_role" "iam_role" {
  name = "iam_role_${var.name}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "iam_policy_attachment" {
  name       = "iam_policy_attachment_${var.name}"
  roles      = [aws_iam_role.iam_role.name]
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "iam_instance_profile_${var.name}"
  role = aws_iam_role.iam_role.name
}
