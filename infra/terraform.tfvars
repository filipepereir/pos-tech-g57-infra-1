# This file contains the variable values for the Terraform configuration.
projectName = "postech-g57" # Nome do projeto
user_name = "pereira" # Nome do usuário IAM
region_default = "us-east-1" # Região padrão da AWS
tags = {
  Name = "postech-g57-fiap",
  School = "FIAP",
  Environment = "Production",
  Year = "2025"
} # Tags para os recursos criados
