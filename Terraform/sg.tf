# security group 

resource "aws_security_group" "deepseek_sg" {
  name_prefix = "deepseek_sg-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict it if using in prod env
  }

  ingress {
    from_port   = 9793
    to_port     = 9793
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict it if using in prod env
  }

   ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "http"
    cidr_blocks = ["0.0.0.0/0"] # Restrict it if using in prod env
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

