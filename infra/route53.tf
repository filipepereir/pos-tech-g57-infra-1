# ======================================
# Route 53 Configuration
# ======================================

# Criar Hosted Zone se não existir
# Terraform irá detectar automaticamente se já existe e não criará duplicata
resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = merge(var.tags, {
    Name = "${var.projectName}-hosted-zone"
    Type = "DNS"
  })

  # Comentado temporariamente para permitir mudança de domínio
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# Registro A para o domínio principal apontando para o ALB
resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }

  depends_on = [aws_lb.main]
}

# Registro A para pos-tech-g57-food-app.com.br
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }

  depends_on = [aws_lb.main]
}

# Registro A para api.pos-tech-g57-food-app.com.br
resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }

  depends_on = [aws_lb.main]
}
