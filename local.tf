locals {
  tags = merge({
    Product       = var.product_name
    Environment = var.environment
    Role          = var.role_name
    Orchestration = var.orchestration
    }
  )
}