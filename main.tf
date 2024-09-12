provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "sanket_inssed" {
  instance_type = "t2.micro"
  ami           = "ami-05134c8ef96964280"
  tags = {
    Name = "sanket12345"
  }
}

resource "aws_instance" "sank" {
  instance_type = "t2.micro"
  ami           = "ami-05134c8ef96964280"
  tags = {
    Name = "sanke"
  }
}
