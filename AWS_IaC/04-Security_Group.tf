############################### Security Group ###############################
resource "aws_security_group" "NICE_security_group" {
  name        = "Security_Group_${var.project_name}"
  description = "Dynamic_${var.project_name}"
  vpc_id      = aws_vpc.main_vpc.id

  # Dynamic Security Group (Inbound rules)
  dynamic "ingress" {
    for_each = var.dynamic_ingress_ports
    content {
      description = var.dynamic_ingress_description
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.dynamic_ingress_cidr
    }
  }
  # Allow all outgoing traffic (Outbound rules)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 indicates all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic to all destinations
  }
  tags = {
    Name = "Security_Group_${var.project_name}"
  }
}
