
resource "aws_instance" "Task1-b" {
  ami           = "ami-0b7f521f805d0a225"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.Finance-profile.name}"

  tags = {
    Name = "Finance role creation"
  }
}