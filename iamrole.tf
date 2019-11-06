
resource "aws_iam_role" "Engineering-role" {
  name               = "Engineering"
  assume_role_policy = "${file("AssumeRolePolicy.json")}"
}

resource "aws_iam_role_policy_attachment" "AdministratorAccess" {
    role       = "${aws_iam_role.Engineering-role.name}"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "Eng-profile" {
  name  = "Engineering-profile"
  roles = ["${aws_iam_role.Engineering-role.name}"]
}

resource "aws_iam_role" "Finance-role" {
  name               = "Finance"
  assume_role_policy = "${file("AssumeRolePolicy.json")}"
}

resource "aws_iam_role_policy_attachment" "Billing" {
    role       = "${aws_iam_role.Finance-role.name}"
    policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_instance_profile" "Finance-profile" {
  name  = "Finance-profile"
  roles = ["${aws_iam_role.Finance-role.name}"]
}


