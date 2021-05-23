resource "aws_iam_group" "joelparkerhenderson" {
  name = "joelparkerhenderson"
}

resource "aws_iam_group_policy_attachment" "joelparkerhenderson__iam_user_change_password" {
  group = "joelparkerhenderson"
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_group_membership" "joelparkerhenderson" {
  name = "joelparkerhenderson"
  group = "joelparkerhenderson"
  users = [
    "joelparkerhenderson"
  ]
}
