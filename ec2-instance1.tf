resource "aws_instance" "Task1-a" {
  ami           = "ami-be7753db"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.Eng-profile.name}"

  tags = {
    Name = "Engneering role creation"
  }
}