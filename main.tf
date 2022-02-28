
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name                 = "HelloWorld"
    git_commit           = "a86823cc39719d97269f12be3234fac536879b5e"
    git_file             = "main.tf"
    git_last_modified_at = "2022-02-28 21:48:48"
    git_last_modified_by = "97243784+mouth-calcite@users.noreply.github.com"
    git_modifiers        = "97243784+mouth-calcite"
    git_org              = "bridgecrew-demo"
    git_repo             = "yor-drift"
    yor_trace            = "3048d159-23fe-4dac-97cb-400ed0de2b13"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name                 = "tf-example"
    git_commit           = "a86823cc39719d97269f12be3234fac536879b5e"
    git_file             = "main.tf"
    git_last_modified_at = "2022-02-28 21:48:48"
    git_last_modified_by = "97243784+mouth-calcite@users.noreply.github.com"
    git_modifiers        = "97243784+mouth-calcite"
    git_org              = "bridgecrew-demo"
    git_repo             = "yor-drift"
    yor_trace            = "0cc5ed70-bcf5-4c24-b4ab-d7117e767ac2"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name                 = "tf-example"
    git_commit           = "a86823cc39719d97269f12be3234fac536879b5e"
    git_file             = "main.tf"
    git_last_modified_at = "2022-02-28 21:48:48"
    git_last_modified_by = "97243784+mouth-calcite@users.noreply.github.com"
    git_modifiers        = "97243784+mouth-calcite"
    git_org              = "bridgecrew-demo"
    git_repo             = "yor-drift"
    yor_trace            = "f43d6457-5a44-440b-8404-5d5fe59e28b5"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name                 = "primary_network_interface"
    git_commit           = "a86823cc39719d97269f12be3234fac536879b5e"
    git_file             = "main.tf"
    git_last_modified_at = "2022-02-28 21:48:48"
    git_last_modified_by = "97243784+mouth-calcite@users.noreply.github.com"
    git_modifiers        = "97243784+mouth-calcite"
    git_org              = "bridgecrew-demo"
    git_repo             = "yor-drift"
    yor_trace            = "d82873ec-ee99-4cb0-b79d-5d88a5929c58"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    git_commit           = "a86823cc39719d97269f12be3234fac536879b5e"
    git_file             = "main.tf"
    git_last_modified_at = "2022-02-28 21:48:48"
    git_last_modified_by = "97243784+mouth-calcite@users.noreply.github.com"
    git_modifiers        = "97243784+mouth-calcite"
    git_org              = "bridgecrew-demo"
    git_repo             = "yor-drift"
    yor_trace            = "5f1872b0-43df-4813-91fe-e2b30f499027"
  }
}

