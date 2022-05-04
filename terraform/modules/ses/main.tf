// IAM
data "aws_iam_policy" "ses_sender" {
  name = "AmazonSESFullAccess"
}

resource "aws_iam_user" "ses_sender" {
  name = "ses_sender"
  path = "/system/"

  tags = {
    ManagedBy = "terraform"
  }
}

resource "aws_iam_access_key" "ses" {
  user = aws_iam_user.ses_sender.name
}

resource "aws_iam_user_policy_attachment" "ses_attach" {
  user       = aws_iam_user.ses_sender.name
  policy_arn = data.aws_iam_policy.ses_sender.arn
}

resource "aws_ssm_parameter" "ses_user_key" {
  name        = "/ses/userKey"
  description = "SES IAM Key"
  type        = "String"
  value       = aws_iam_access_key.ses.id
}

resource "aws_ssm_parameter" "ses_user_secret" {
  name        = "/ses/userSecret"
  description = "SES IAM Secret"
  type        = "SecureString"
  value       = aws_iam_access_key.ses.secret
}

// SES?