############################
# EC2 Instance
############################

resource "aws_instance" "this" {
  ami                    = "ami-073130f74f5ffb161"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile   = var.iam_instance_profile_name

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.delete_on_termination
  }

  credit_specification {
    cpu_credits = "standard"
  }

  tags = merge(
    var.tags,
    { Name = "${var.environment}-ec2" }
  )
}

######## Attaching EIP to the instance #############
resource "aws_eip" "firewall" {
  instance = aws_instance.this.id
  domain   = "vpc"
}