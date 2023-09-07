locals {
  tags = merge({
    Product       = var.product_name
    Role          = var.role_name
    Orchestration = var.orchestration
    }
  )
}