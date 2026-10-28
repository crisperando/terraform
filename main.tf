data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.instance_type
  environment   = var.environment
  project       = var.project
  subnet_id     = sort(data.aws_subnets.default.ids)[0]
  vpc_id        = data.aws_vpc.default.id
}
