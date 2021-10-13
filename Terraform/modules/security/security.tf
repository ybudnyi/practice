resource "aws_security_group" "allow_db_conection" {
  name        = "allow_db_conection"
  vpc_id      = var.vpc_id

  ingress = [
    {
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp",
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      "description": "HTTPS",
      "prefix_list_ids": null,
      "security_groups": null,
      "self": null
    }
  ]

  egress = [
    {
      from_port        = 0,
      to_port          = 0,
      protocol         = "-1",
      cidr_blocks      = ["0.0.0.0/0"],
      ipv6_cidr_blocks = ["::/0"]
      "description": "HTTPS",
      "prefix_list_ids": null,
      "security_groups": null,
      "self": null
    }
  ]

  tags = {
    ita_group = "Lv-613"
  }
}
