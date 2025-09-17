resource "aws_iam_user" "dev_readonly" {
  name = "dev-readonly"
}

resource "aws_iam_user_policy_attachment" "readonly" {
  user       = aws_iam_user.dev_readonly.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_access_key" "dev_readonly_key" {
  user = aws_iam_user.dev_readonly.name
}
